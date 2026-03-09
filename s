-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

-- Decompiled with Konstant V2.1, a fast Luau decompiler made in Luau by plusgiant5 (https://discord.gg/brNTY8nX8t)
-- Decompiled on 2026-02-15 12:34:35
-- Luau version 6, Types version 3
-- Time taken: 0.525558 seconds

local tbl_6_upvr = {
	Players = game:GetService("Players");
	UserInputService = game:GetService("UserInputService");
	RunService = game:GetService("RunService");
	ReplicatedStorage = game:GetService("ReplicatedStorage");
	Workspace = game:GetService("Workspace");
	StarterGui = game:GetService("StarterGui");
	ContextActionService = game:GetService("ContextActionService");
	SoundService = game:GetService("SoundService");
	Tween = game:GetService("TweenService");
	ProximityService = game:GetService("ProximityPromptService");
	HttpService = game:GetService("HttpService");
	HapticService = game:GetService("HapticService");
}
tbl_6_upvr.StarterGui:SetCoreGuiEnabled(Enum.CoreGuiType.PlayerList, false)
local module_5_upvr = require(tbl_6_upvr.ReplicatedStorage.Game.Modules:WaitForChild("TeamsService"))
local tbl_16_upvr = {
	Framework = tbl_6_upvr.ReplicatedStorage:WaitForChild("Framework");
	LocalPlayer = tbl_6_upvr.Players.LocalPlayer;
}
script.Name = string.format("%d_%s_%s", tbl_16_upvr.LocalPlayer.UserId, tbl_6_upvr.HttpService:GenerateGUID(false), tbl_16_upvr.LocalPlayer.Name)
tbl_16_upvr.Settings = require(tbl_16_upvr.Framework:WaitForChild("Config"))
tbl_16_upvr.LocalModules = script.LocalModules
tbl_16_upvr.GlobalJanitor = require(tbl_16_upvr.Framework.Modules:WaitForChild("Janitor")).new()
tbl_16_upvr.CharacterJanitor = require(tbl_16_upvr.Framework.Modules:WaitForChild("Janitor")).new()
tbl_16_upvr.ViewmodelJanitor = require(tbl_16_upvr.Framework.Modules:WaitForChild("Janitor")).new()
tbl_16_upvr.Remotes = tbl_16_upvr.Framework:WaitForChild("Remotes")
tbl_16_upvr.Models = tbl_16_upvr.Framework:WaitForChild("Models")
tbl_16_upvr.Animations = tbl_16_upvr.Framework:WaitForChild("Animations")
tbl_16_upvr.Client = tbl_16_upvr.Models:WaitForChild("Client")
tbl_16_upvr.ServerModels = tbl_16_upvr.Models:WaitForChild("ServerModels")
tbl_16_upvr.AudioLibrary = tbl_16_upvr.Framework.AudioLibrary
tbl_16_upvr.Breath = tbl_16_upvr.AudioLibrary.Breath
tbl_16_upvr.AimingSounds = tbl_16_upvr.Breath.Aiming
tbl_16_upvr.GunHud = tbl_16_upvr.Framework:WaitForChild("GunHud"):Clone()
tbl_16_upvr.GunHud.Parent = tbl_16_upvr.LocalPlayer.PlayerGui
tbl_16_upvr._magSlots = nil
tbl_16_upvr._burstLatch = false
tbl_16_upvr.BridgeNet = require(tbl_16_upvr.Framework.Modules:WaitForChild("BridgeNet2"))
tbl_16_upvr.Bridges = {
	WeaponAction = tbl_16_upvr.BridgeNet.ReferenceBridge("WeaponAction");
	SuppressorBridge = tbl_16_upvr.BridgeNet.ReferenceBridge("SuppressorState");
	ReplicateBullet = tbl_16_upvr.BridgeNet.ReferenceBridge("ReplicateBullet");
	Supression = tbl_16_upvr.BridgeNet.ReferenceBridge("Supression");
	ReplicateSound = tbl_16_upvr.BridgeNet.ReferenceBridge("Sound");
	MedicineBridge = tbl_16_upvr.BridgeNet.ReferenceBridge("MedicineEvent");
	HolsterBridge = tbl_16_upvr.BridgeNet.ReferenceBridge("HolsterServer");
	GrenadeBridge = tbl_16_upvr.BridgeNet.ReferenceBridge("Grenade");
	AmmoBox = tbl_16_upvr.BridgeNet.ReferenceBridge("AmmoBox");
	LaserBridge = tbl_16_upvr.BridgeNet.ReferenceBridge("LaserState");
	MessageBridge = tbl_16_upvr.BridgeNet.ReferenceBridge("MessageEvent");
	LauncherBridge = tbl_16_upvr.BridgeNet.ReferenceBridge("Launcher");
	HitPlayerBridge = tbl_16_upvr.BridgeNet.ReferenceBridge("HitPlayer");
	LoadData = tbl_16_upvr.BridgeNet.ReferenceBridge("LoadData");
	LoadGuns = tbl_16_upvr.BridgeNet.ReferenceBridge("LoadGuns");
	HitConfirmBridge = tbl_16_upvr.BridgeNet.ReferenceBridge("HitConfirm");
}
tbl_16_upvr.Functions = {
	SwitchFireMode = nil;
}
tbl_16_upvr.Effects = tbl_16_upvr.GunHud:WaitForChild("Effects")
tbl_16_upvr.Supress = tbl_16_upvr.Effects:WaitForChild("Supression")
tbl_16_upvr.GunHudFrame = tbl_16_upvr.GunHud:WaitForChild("GunHud")
tbl_16_upvr.CompassFrame = tbl_16_upvr.GunHud:WaitForChild("CompassFrame")
tbl_16_upvr.currentStrength = 0
tbl_16_upvr.decayRate = 0.3
tbl_16_upvr.heartbeatConn = nil
tbl_16_upvr.WhizzPool = {}
tbl_16_upvr.WHIZZ_POOL_SIZE = tbl_16_upvr.Settings.WhizzPoolSize or 6
tbl_16_upvr.GetSecureSettings = tbl_16_upvr.Remotes:WaitForChild("GetSecureSettings")
tbl_16_upvr.RefillRemotes = {
	AmmoRefillQuery = tbl_16_upvr.Remotes:WaitForChild("AmmoRefillQuery");
	AmmoRefillReply = tbl_16_upvr.Remotes:WaitForChild("AmmoRefillReply");
	AmmoRefillGrant = tbl_16_upvr.Remotes:WaitForChild("AmmoRefillGrant");
}
tbl_16_upvr.TweenService = game:GetService("TweenService")
local var7_upvw
local function INLINED() -- Internal function, doesn't exist in bytecode
	var7_upvw = tbl_16_upvr.Settings.OverheatDefaults
	return var7_upvw
end
if not tbl_16_upvr.Settings or not INLINED() then
	var7_upvw = {}
end
tbl_16_upvr.OH = var7_upvw
var7_upvw = nil
tbl_16_upvr.OverheatEnabledValue = var7_upvw
var7_upvw = require(tbl_16_upvr.Framework.Modules:WaitForChild("RecoilModule")).new()
tbl_16_upvr.RecoilModule = var7_upvw
var7_upvw = 0
tbl_16_upvr._lastRecoilTime = var7_upvw
var7_upvw = true
tbl_16_upvr._recoilSettled = var7_upvw
var7_upvw = tbl_16_upvr.Settings.RecoilStateMultipliers
if not var7_upvw then
	var7_upvw = {}
	var7_upvw.Standing = 1
	var7_upvw.Moving = 1.3
	var7_upvw.Airborne = 1.5
	var7_upvw.Jumping = 1.75
	var7_upvw.Crouching = 0.65
	var7_upvw.Prone = 0.4
	var7_upvw.HoldingFocus = 0.6
	var7_upvw.Aiming = 0.85
	var7_upvw.bipod = 0.2
end
tbl_16_upvr.RecoilStateMultipliers = var7_upvw
var7_upvw = 0.5
tbl_16_upvr.RECOIL_MULT_MIN = var7_upvw
var7_upvw = 2.5
tbl_16_upvr.RECOIL_MULT_MAX = var7_upvw
var7_upvw = nil
tbl_16_upvr.ActiveBreathSound = var7_upvw
var7_upvw = false
tbl_16_upvr.equipping = var7_upvw
var7_upvw = nil
tbl_16_upvr.Character = var7_upvw
var7_upvw = nil
tbl_16_upvr.humanoid = var7_upvw
var7_upvw = nil
tbl_16_upvr.hrp = var7_upvw
var7_upvw = nil
tbl_16_upvr.CachedHitParams = var7_upvw
var7_upvw = {}
var7_upvw.Viewmodel = nil
var7_upvw.GunModel = nil
var7_upvw.SettingsGun = nil
var7_upvw.AimBlur = Instance.new("DepthOfFieldEffect")
var7_upvw.SuppressionBlur = Instance.new("BlurEffect")
tbl_16_upvr.Assets = var7_upvw
var7_upvw = nil
tbl_16_upvr.currentTool = var7_upvw
var7_upvw = false
tbl_16_upvr.equipped = var7_upvw
var7_upvw = false
tbl_16_upvr.isFiring = var7_upvw
var7_upvw = false
tbl_16_upvr.Aiming = var7_upvw
var7_upvw = 1
tbl_16_upvr.AimMode = var7_upvw
var7_upvw = {}
tbl_16_upvr.FireModeList = var7_upvw
var7_upvw = 1
tbl_16_upvr.FireModeIndex = var7_upvw
var7_upvw = 0
tbl_16_upvr.FireRate = var7_upvw
var7_upvw = 0
tbl_16_upvr._equipToken = var7_upvw
var7_upvw = {}
tbl_16_upvr.BoundActionNames = var7_upvw
var7_upvw = 0
tbl_16_upvr.lastDryFireAt = var7_upvw
var7_upvw = 0.2
tbl_16_upvr.DRY_COOLDOWN = var7_upvw
var7_upvw = nil
tbl_16_upvr.JammedValue = var7_upvw
var7_upvw = 0.15
tbl_16_upvr.HeatPerShot = var7_upvw
var7_upvw = 1.5
tbl_16_upvr.HeatDecayRate = var7_upvw
var7_upvw = 40
tbl_16_upvr.MaxHeat = var7_upvw
var7_upvw = nil
tbl_16_upvr.Torso = var7_upvw
var7_upvw = nil
tbl_16_upvr.Neck = var7_upvw
var7_upvw = true
tbl_16_upvr.CanShoot = var7_upvw
var7_upvw = nil
tbl_16_upvr.Waist = var7_upvw
var7_upvw = nil
tbl_16_upvr.Head = var7_upvw
var7_upvw = nil
tbl_16_upvr.NeckOrigin = var7_upvw
var7_upvw = nil
tbl_16_upvr.WaistOrigin = var7_upvw
var7_upvw = tbl_6_upvr.Workspace.CurrentCamera
tbl_16_upvr.Camera = var7_upvw
var7_upvw = {}
tbl_16_upvr.PerToolState = var7_upvw
var7_upvw = 0
tbl_16_upvr.lastSent = var7_upvw
var7_upvw = 0
tbl_16_upvr._headSendToken = var7_upvw
var7_upvw = nil
tbl_16_upvr._lastSentC0 = var7_upvw
var7_upvw = nil
tbl_16_upvr.ChamberedValue = var7_upvw
var7_upvw = require(tbl_16_upvr.Framework:WaitForChild("KeyBinds")).InputBindings
tbl_16_upvr.InputBindings = var7_upvw
var7_upvw = 0
local function _() -- Line 139, Named "GenerateShotId"
	--[[ Upvalues[1]:
		[1]: var7_upvw (read and write)
	]]
	var7_upvw += 1
	return var7_upvw
end
local clamp_upvr = math.clamp
local time_upvr = time
local Camera_2_upvw = tbl_16_upvr.Camera
tbl_6_upvr.Workspace:GetPropertyChangedSignal("CurrentCamera"):Connect(function() -- Line 163
	--[[ Upvalues[3]:
		[1]: Camera_2_upvw (read and write)
		[2]: tbl_6_upvr (readonly)
		[3]: tbl_16_upvr (readonly)
	]]
	Camera_2_upvw = tbl_6_upvr.Workspace.CurrentCamera
	tbl_16_upvr.Camera = Camera_2_upvw
end)
tbl_16_upvr.ShowInputBindingsWhen = {
	SuppressorToggle = "AlwaysButNotAiming";
	Shoot = "AlwaysButNotBusy";
	Bipod = "AlwaysButNotBusy";
	Reload = "AlwaysButNotAiming";
	Aim = "AlwaysButNotAiming";
	AmmoBox = "AlwaysButNotBusy";
	ChangeAim = "WhenAiming";
	ChangeFiremode = "AlwaysButNotAiming";
	BoltPull = "WhenJammed";
	ToggleLaser = "AlwaysButNotBusy";
	ToggleFlashlight = "AlwaysButNotBusy";
	BlindFire = "AlwaysButNotBusy";
	HoldingFocus = "WhenAiming";
	Ping = "AlwaysButNotBusy";
	ActionFrame = "AlwaysButNotBusy";
	Sprint = "AlwaysButNotBusy";
	Crouch = "AlwaysButNotBusy";
	ReverseCrouch = "AlwaysButNotBusy";
	LeanLeft = "AlwaysButNotBusy";
	LeanRight = "AlwaysButNotBusy";
	WallClimb = "AlwaysButNotBusy";
	FreeLook = "AlwaysButNotBusy";
}
tbl_16_upvr.InputBindingsAlways = require(tbl_16_upvr.Framework:WaitForChild("KeyBinds")).InputBindingsAlways
tbl_16_upvr.Manual = {
	Type = nil;
	EjectOn = "Cycle";
	AutoChamber = false;
	ChamberWhileAim = false;
	CycleAnimName = "Chamber";
	NeedCycle = false;
}
tbl_16_upvr.ReloadState = {
	isReloading = false;
	canCancel = false;
	reloadToken = 0;
	magazineEjected = false;
	pointOfNoReturn = false;
	cancelPenalty = 0.5;
	lastCancelTime = 0;
}
tbl_16_upvr.KeybindUIs = {}
tbl_16_upvr._bindsBuilt = false
tbl_16_upvr.ADSMesh = {
	groups = {};
	ready = false;
	_lastOn = -1;
	_lastGroup = -1;
	_aimToken = 0;
}
tbl_16_upvr.AmmoValue = nil
tbl_16_upvr.MaxAmmo = 0
tbl_16_upvr.Reloading = false
tbl_16_upvr.RecoilProfile = nil
tbl_16_upvr.UpdateSpeed = tbl_16_upvr.Settings.UpdateSpeed
tbl_16_upvr.HeadHorFactor = tbl_16_upvr.Settings.HeadHorFactor
tbl_16_upvr.HeadVertFactor = tbl_16_upvr.Settings.HeadVertFactor
tbl_16_upvr.BodyHorFactor = tbl_16_upvr.Settings.BodyHorFactor
tbl_16_upvr.BodyVertFactor = tbl_16_upvr.Settings.BodyVertFactor
tbl_16_upvr.SendInterval = tbl_16_upvr.Settings.SendInterval
tbl_16_upvr.EnableWaist = tbl_16_upvr.Settings.EnableWaist
tbl_16_upvr.States = {
	blindfireRot = Vector2.zero;
	blindfirePos = Vector2.zero;
	smoothCF = Vector2.zero;
	smoothCFPos = Vector2.zero;
	walkBobTime = 0;
	walkFactor = 0;
	AimCF = CFrame.new();
	prevAimFactor = 0;
	LongAimPeriod = 0;
	LimitRot = Vector2.new(10, 25);
	LimitPos = Vector2.new(0.1, 0.05);
	BlindFire = false;
	boltBusy = false;
	StaminaValue = 500;
	StanceViewmodel = 0;
	ActionFrame = tbl_16_upvr.GunHud:WaitForChild("ActionFrame");
	GunTilting = false;
	NVG = false;
}
tbl_16_upvr.Springs = {}
tbl_16_upvr.StateValues = {
	breathTime = tbl_16_upvr.Settings.BreathTime;
	LerpSpeed = tbl_16_upvr.Settings.LerpSpeed;
	AimLerpSpeed = tbl_16_upvr.Settings.AimLerpSpeed;
}
tbl_16_upvr.AnimationsTable = {}
tbl_16_upvr._actionCooldowns = {}
tbl_16_upvr.muzzleEmitters = {}
tbl_16_upvr.muzzleLights = {}
tbl_16_upvr.muzzle = nil
tbl_16_upvr.bolt = nil
tbl_16_upvr.motor = nil
tbl_16_upvr.drySound = nil
tbl_16_upvr._activeFireLoopId = 0
tbl_16_upvr.suppressDir = Vector2.new(0, 0)
tbl_16_upvr.SUPPRESS_ROLL = 0.06
tbl_16_upvr.SUPPRESS_YAW = 0.04
tbl_16_upvr.SUPPRESS_STRAFE = 0.15
tbl_16_upvr.SUPPRESS_PITCH = 0.06
tbl_16_upvr.SUPPRESS_BLUR_MAX = 6
tbl_16_upvr.SUPPRESS_VIGNETTE_MAX = 0.65
tbl_16_upvr.DebugFlags = {
	Bullets = false;
}
tbl_16_upvr.Modules = {
	Spring = require(tbl_16_upvr.Framework.Modules:WaitForChild("Spring"));
	Utilities = require(tbl_16_upvr.Framework.Modules:WaitForChild("Utilities"));
	Janitor = require(tbl_16_upvr.Framework.Modules:WaitForChild("Janitor"));
	KeyframeSequencePlayer = require(tbl_16_upvr.Framework.Modules:WaitForChild("KeyframeSequencePlayer"));
	ViewmodelSetup = require(tbl_16_upvr.Framework.Modules:WaitForChild("ViewmodelSetup"));
	Bobble = require(tbl_16_upvr.Framework.Modules:WaitForChild("Bobble"));
	BulletSimulator = require(tbl_16_upvr.Framework.Modules:WaitForChild("BulletSimulator"));
	ViewmodelController = require(tbl_16_upvr.Framework.Modules:WaitForChild("ViewmodelController"));
	RecoilModule = tbl_16_upvr.RecoilModule;
	SoundHandle = require(tbl_16_upvr.Framework.Modules:WaitForChild("SoundHandle"));
	MagazineController = require(tbl_16_upvr.Framework.Modules:WaitForChild("MagazineController"));
	RecoilCamera = require(tbl_16_upvr.Framework.Modules:WaitForChild("RecoilCamera"));
	ShellEject = require(tbl_16_upvr.Framework.Modules:WaitForChild("ShellEject"));
	SightModule = require(tbl_16_upvr.Framework.Modules:WaitForChild("SightModule"));
	LaserHandler = require(tbl_16_upvr.Framework.Modules:WaitForChild("LaserHandler"));
	SystemSFX = require(tbl_16_upvr.Framework.Modules:WaitForChild("SystemSFX"));
	MobileHandler = require(tbl_16_upvr.Framework.Modules:WaitForChild("MobileHandler"));
	MovementModule = require(tbl_16_upvr.LocalModules.MovementModule);
	HeadMovement = require(tbl_16_upvr.LocalModules.HeadMovement);
}
tbl_16_upvr.BasicSound = tbl_6_upvr.SoundService:WaitForChild("Basic")
eq = Instance.new("EqualizerSoundEffect") -- Setting global
eq.Parent = tbl_16_upvr.BasicSound
eq.LowGain = 1
eq.MidGain = 1
eq.HighGain = 1
eq.Name = "EqualizerSoundEffectFocus"
tbl_16_upvr.LocalUtilities = require(tbl_16_upvr.LocalModules.Utilities)
tbl_16_upvr.BobbleModule = tbl_16_upvr.Modules.Bobble.new()
tbl_16_upvr.CAS_ActionHandler = nil
tbl_16_upvr.BulletPoolModule = require(tbl_16_upvr.Framework.Modules:WaitForChild("BulletPool"))
tbl_16_upvr.bulletTemplate = tbl_16_upvr.Framework.Essentials:WaitForChild("Bullet"):Clone()
tbl_16_upvr.bulletTemplate.Anchored = true
tbl_16_upvr.bulletTemplate.CanCollide = false
tbl_16_upvr.bulletTemplate.Name = "BulletTemplate"
tbl_16_upvr.BulletPool = tbl_16_upvr.BulletPoolModule.new(tbl_16_upvr.bulletTemplate, tbl_16_upvr.Settings.BulletPoolSize)
local tbl_26 = {
	_pool = {};
}
local HitEffectPoolSize = tbl_16_upvr.Settings.HitEffectPoolSize
if not HitEffectPoolSize then
	HitEffectPoolSize = 40
end
tbl_26._size = HitEffectPoolSize
tbl_26._index = 1
tbl_26._initialized = false
tbl_16_upvr.HitEffectPool = tbl_26
tbl_16_upvr.HitEffectPool.Init = function(arg1) -- Line 327, Named "Init"
	-- KONSTANTWARNING: Variable analysis failed. Output will have some incorrect variable assignments
	local var26
	if var26 then
	else
		var26 = true
		arg1._initialized = var26
		var26 = workspace:FindFirstChild("ClientTrash")
		if not var26 then
			var26 = workspace
		end
		local Part_2 = Instance.new("Part")
		Part_2.Name = "HitEffect"
		Part_2.Size = Vector3.new(0.10000, 0.10000, 0.10000)
		Part_2.Anchored = true
		Part_2.CanCollide = false
		Part_2.CanQuery = false
		Part_2.CanTouch = false
		Part_2.Transparency = 1
		Instance.new("Attachment").Parent = Part_2
		for i_36 = 1, arg1._size do
			local clone_5 = Part_2:Clone()
			clone_5.CFrame = CFrame.new(0, -1000, 0)
			clone_5.Parent = var26
			arg1._pool[i_36] = {
				part = clone_5;
				attachment = clone_5:FindFirstChild("Attachment");
				inUse = false;
				returnTime = 0;
			}
			local var30
		end
		var30:Destroy()
	end
end
tbl_16_upvr.HitEffectPool.Get = function(arg1) -- Line 354, Named "Get"
	for i = 1, arg1._size do
		local var32 = (arg1._index + i - 2) % arg1._size + 1
		local var33 = arg1._pool[var32]
		if not var33.inUse or 2 < time() - var33.returnTime then
			var33.inUse = true
			arg1._index = var32 % arg1._size + 1
			return var33
		end
	end
	local var34 = arg1._pool[arg1._index]
	var34.inUse = true
	arg1._index = arg1._index % arg1._size + 1
	return var34
end
tbl_16_upvr.HitEffectPool.Return = function(arg1, arg2) -- Line 371, Named "Return"
	if arg2 then
		arg2.inUse = false
		arg2.returnTime = time()
		arg2.part.CFrame = CFrame.new(0, -1000, 0)
	end
end
tbl_16_upvr.HitEffectPool:Init()
tbl_16_upvr.Assets.AimBlur.FarIntensity = 0
tbl_16_upvr.Assets.AimBlur.FocusDistance = 1
tbl_16_upvr.Assets.AimBlur.InFocusRadius = 2
tbl_16_upvr.Assets.AimBlur.NearIntensity = 0.25
tbl_16_upvr.Assets.AimBlur.Parent = tbl_16_upvr.Camera
local any_new_result1_upvr = tbl_16_upvr.Modules.MobileHandler.new()
if any_new_result1_upvr then
	any_new_result1_upvr:HandleIt()
end
if not tbl_16_upvr.Assets._activeTweens then
end
tbl_16_upvr.Assets._activeTweens = {
	fov = nil;
	dof = nil;
	ads = {};
	boltPull = nil;
	boltReset = nil;
}
tbl_16_upvr._TI = {
	FOV = TweenInfo.new(tbl_16_upvr.Settings.FOVTweenTime, tbl_16_upvr.Settings.FOVTweenStyle, tbl_16_upvr.Settings.FOVTweenDirection);
	DOF = TweenInfo.new(tbl_16_upvr.Settings.FOVTweenTime, tbl_16_upvr.Settings.FOVTweenStyle, tbl_16_upvr.Settings.FOVTweenDirection);
}
tbl_16_upvr._TI_ADS = TweenInfo.new(tbl_16_upvr.Settings.AdsMeshTweenTime, tbl_16_upvr.Settings.AdsMeshTweenStyle, tbl_16_upvr.Settings.AdsMeshTweenDirection)
tbl_16_upvr.Modules.MovementModule.Init(tbl_16_upvr.States, tbl_16_upvr.InputBindingsAlways, tbl_16_upvr.Settings, tbl_16_upvr.AnimationsTable, tbl_16_upvr)
tbl_16_upvr.CharacterJanitor:Add(tbl_6_upvr.RunService.Heartbeat:Connect(function() -- Line 407
	--[[ Upvalues[1]:
		[1]: tbl_16_upvr (readonly)
	]]
	if tbl_16_upvr.Character then
		local Crouching = tbl_16_upvr.Character:GetAttribute("Crouching")
		local Prone = tbl_16_upvr.Character:GetAttribute("Prone")
		local Sprinting = tbl_16_upvr.Character:GetAttribute("Sprinting")
		if Crouching ~= nil then
			tbl_16_upvr.States.Crouching = Crouching
		end
		if Prone ~= nil then
			tbl_16_upvr.States.Prone = Prone
		end
		if Sprinting ~= nil then
			tbl_16_upvr.States.Sprinting = Sprinting
		end
	end
end), "Disconnect")
local function _() -- Line 420, Named "SyncMovementStates"
	--[[ Upvalues[1]:
		[1]: tbl_16_upvr (readonly)
	]]
	if tbl_16_upvr.Character then
		tbl_16_upvr.States.Crouching = tbl_16_upvr.Character:GetAttribute("Crouching") or false
		tbl_16_upvr.States.Prone = tbl_16_upvr.Character:GetAttribute("Prone") or false
		tbl_16_upvr.States.Sprinting = tbl_16_upvr.Character:GetAttribute("Sprinting") or false
	end
end
tbl_16_upvr.Modules.HeadMovement.Init(tbl_16_upvr.States)
tbl_16_upvr.Assets.SuppressionBlur.Size = 0
tbl_16_upvr.Assets.SuppressionBlur.Name = "SuppressionBlur"
tbl_16_upvr.Assets.SuppressionBlur.Parent = tbl_16_upvr.Camera
local function _() -- Line 432, Named "OverheatEnabled"
	--[[ Upvalues[1]:
		[1]: tbl_16_upvr (readonly)
	]]
	local OverheatEnabledValue_2 = tbl_16_upvr.OverheatEnabledValue
	if OverheatEnabledValue_2 then
		if tbl_16_upvr.OverheatEnabledValue.Value ~= true then
			OverheatEnabledValue_2 = false
		else
			OverheatEnabledValue_2 = true
		end
	end
	return OverheatEnabledValue_2
end
local function _() -- Line 433, Named "OverheatDisabled"
	--[[ Upvalues[1]:
		[1]: tbl_16_upvr (readonly)
	]]
	local OverheatEnabledValue = tbl_16_upvr.OverheatEnabledValue
	if OverheatEnabledValue then
		if tbl_16_upvr.OverheatEnabledValue.Value ~= false then
			OverheatEnabledValue = false
		else
			OverheatEnabledValue = true
		end
	end
	return OverheatEnabledValue
end
local module_4_upvr = {
	character = nil;
	humanoid = nil;
	hrp = nil;
	lastUpdate = 0;
}
local function _() -- Line 442, Named "GetCachedCharacter"
	--[[ Upvalues[2]:
		[1]: module_4_upvr (readonly)
		[2]: tbl_16_upvr (readonly)
	]]
	local time_result1 = time()
	if 0.1 < time_result1 - module_4_upvr.lastUpdate then
		module_4_upvr.character = tbl_16_upvr.LocalPlayer.Character
		local character = module_4_upvr.character
		if character then
			character = module_4_upvr.character:FindFirstChildOfClass("Humanoid")
		end
		module_4_upvr.humanoid = character
		character = module_4_upvr.character
		local var47 = character
		if var47 then
			var47 = module_4_upvr.character:FindFirstChild("HumanoidRootPart")
		end
		module_4_upvr.hrp = var47
		module_4_upvr.lastUpdate = time_result1
	end
	return module_4_upvr
end
local tbl_4_upvr = {}
local function RefreshHitFilter_upvr() -- Line 457, Named "RefreshHitFilter"
	--[[ Upvalues[2]:
		[1]: tbl_4_upvr (readonly)
		[2]: tbl_16_upvr (readonly)
	]]
	table.clear(tbl_4_upvr)
	if tbl_16_upvr.Character then
		table.insert(tbl_4_upvr, tbl_16_upvr.Character)
	end
	if tbl_16_upvr.Assets and tbl_16_upvr.Assets.Viewmodel then
		table.insert(tbl_4_upvr, tbl_16_upvr.Assets.Viewmodel)
	end
	local BulletPool = workspace:FindFirstChild("BulletPool")
	if BulletPool then
		table.insert(tbl_4_upvr, BulletPool)
	end
	local ClientTrash = workspace:FindFirstChild("ClientTrash")
	if ClientTrash then
		table.insert(tbl_4_upvr, ClientTrash)
	end
	if tbl_16_upvr.CachedHitParams then
		tbl_16_upvr.CachedHitParams.FilterDescendantsInstances = tbl_4_upvr
	end
end
local var51_upvw = 0
local function _() -- Line 473, Named "GetHitRaycastParams"
	--[[ Upvalues[3]:
		[1]: tbl_16_upvr (readonly)
		[2]: RefreshHitFilter_upvr (readonly)
		[3]: var51_upvw (read and write)
	]]
	if not tbl_16_upvr.CachedHitParams then
		tbl_16_upvr.CachedHitParams = RaycastParams.new()
		tbl_16_upvr.CachedHitParams.FilterType = Enum.RaycastFilterType.Exclude
		tbl_16_upvr.CachedHitParams.IgnoreWater = true
		RefreshHitFilter_upvr()
	end
	local time_result1_5 = time()
	if 0.5 < time_result1_5 - var51_upvw then
		RefreshHitFilter_upvr()
		var51_upvw = time_result1_5
	end
	return tbl_16_upvr.CachedHitParams
end
local function _(arg1, arg2) -- Line 490, Named "hasDescendantWithName"
	if not arg1 or not arg1:IsA("Model") then
		return false
	end
	if arg1:FindFirstChild(arg2, true) == nil then
	else
	end
	return true
end
local function _(arg1, arg2, arg3, arg4) -- Line 495, Named "_cframeChangedEnough"
	if not arg1 or not arg2 then
		return true
	end
	if (arg3 or 0.01) < (arg1.Position - arg2.Position).Magnitude then
		return true
	end
	local _, _, _, any_GetComponents_result4, _, _, _, any_GetComponents_result8, _, _, _, any_GetComponents_result12 = arg2:ToObjectSpace(arg1):GetComponents()
	local clamped_5 = math.clamp((any_GetComponents_result4 + any_GetComponents_result8 + any_GetComponents_result12 - 1) * 0.5, -1, 1)
	if (arg4 or 0.008726646259971648) >= math.acos(clamped_5) then
		clamped_5 = false
	else
		clamped_5 = true
	end
	return clamped_5
end
local function GetToolState_upvr(arg1) -- Line 507, Named "GetToolState"
	--[[ Upvalues[1]:
		[1]: tbl_16_upvr (readonly)
	]]
	if not arg1 then
		return nil
	end
	local var66 = tbl_16_upvr.PerToolState[arg1]
	if not var66 then
		var66 = {
			nextShotTime = 0;
			lastShotAt = 0;
			rapidStreak = 0;
			Overheated = false;
			Heat = 0;
		}
		tbl_16_upvr.PerToolState[arg1] = var66
	end
	return var66
end
local function HeartbeatWait_upvr(arg1) -- Line 523, Named "HeartbeatWait"
	--[[ Upvalues[1]:
		[1]: tbl_6_upvr (readonly)
	]]
	if not arg1 or arg1 <= 0 then
	else
		while true do
			tbl_6_upvr.RunService.Heartbeat:Wait()
			if time() + arg1 <= time() then break end
		end
	end
end
local function _(arg1) -- Line 529, Named "CancelTween"
	if arg1 then
		pcall(function() -- Line 530
			--[[ Upvalues[1]:
				[1]: arg1 (readonly)
			]]
			arg1:Cancel()
		end)
	end
end
local function _(arg1) -- Line 533, Named "UnbindSafe"
	--[[ Upvalues[1]:
		[1]: tbl_6_upvr (readonly)
	]]
	pcall(function() -- Line 534
		--[[ Upvalues[2]:
			[1]: tbl_6_upvr (copied, readonly)
			[2]: arg1 (readonly)
		]]
		tbl_6_upvr.RunService:UnbindFromRenderStep(arg1)
	end)
end
local function _(arg1, arg2, arg3) -- Line 537, Named "Connect"
	local any_Connect_result1 = arg2:Connect(arg3)
	if arg1 then
		arg1:Add(any_Connect_result1, "Disconnect")
	end
	return any_Connect_result1
end
local function _(arg1, arg2, arg3) -- Line 543, Named "OnTweenCompleted"
	if not arg2 then return end
	local var72_upvw
	var72_upvw = arg2.Completed:Connect(function(...) -- Line 545
		--[[ Upvalues[2]:
			[1]: var72_upvw (read and write)
			[2]: arg3 (readonly)
		]]
		if var72_upvw then
			var72_upvw:Disconnect()
			var72_upvw = nil
		end
		arg3(...)
	end)
	local var73 = var72_upvw
	if arg1 then
		arg1:Add(var73, "Disconnect")
	end
	return var73
end
local function _(arg1, arg2) -- Line 553, Named "withBusy"
	--[[ Upvalues[1]:
		[1]: tbl_16_upvr (readonly)
	]]
	if tbl_16_upvr.States[arg1] then
		return false
	end
	tbl_16_upvr.States[arg1] = true
	local pcall_result1_2, pcall_result2_2 = pcall(arg2)
	tbl_16_upvr.States[arg1] = false
	if not pcall_result1_2 then
		warn(arg1.." error:", pcall_result2_2)
	end
	return pcall_result1_2
end
local function getPlatformIcons_upvr() -- Line 562, Named "getPlatformIcons"
	--[[ Upvalues[2]:
		[1]: tbl_6_upvr (readonly)
		[2]: tbl_16_upvr (readonly)
	]]
	for _, v in ipairs(tbl_6_upvr.UserInputService:GetConnectedGamepads()) do
		if v == Enum.UserInputType.Gamepad1 then
			return tbl_16_upvr.Framework.Essentials.Icons.Controller.PS
		end
		if v == Enum.UserInputType.Gamepad2 then
			return tbl_16_upvr.Framework.Essentials.Icons.Controller.Xbox
		end
	end
	return tbl_16_upvr.Framework.Essentials.Icons.Desktop
end
local function _(arg1, arg2) -- Line 570, Named "getIconForInput"
	if typeof(arg2) == "EnumItem" and (arg2.EnumType == Enum.KeyCode or arg2.EnumType == Enum.UserInputType) then
		return arg1:FindFirstChild(arg2.Name)
	end
	return nil
end
local function _collectADSParts_upvr(arg1) -- Line 615, Named "_collectADSParts"
	-- KONSTANTWARNING: Variable analysis failed. Output will have some incorrect variable assignments
	local module_8 = {}
	if not arg1 then
		return module_8
	end
	for _, v_2 in ipairs(arg1:GetDescendants()) do
		local var153
		if v_2:IsA("BasePart") then
			var153 = "MeshRole"
			local attribute_4 = v_2:GetAttribute(var153)
			local Name_11 = v_2.Name
			var153 = true
			if Name_11 ~= "REG" then
				var153 = true
				if attribute_4 ~= "REG" then
					var153 = false
					if type(attribute_4) == "string" then
						var153 = attribute_4:match("^REG")
					end
				end
			end
			local var156 = true
			if Name_11 ~= "ADS" then
				var156 = true
				if attribute_4 ~= "ADS" then
					var156 = false
					if type(attribute_4) == "string" then
						var156 = attribute_4:match("^ADS")
						local var157
					end
				end
			end
			if var153 or var156 then
				var157 = v_2:GetAttribute("AimGroup")
				local function INLINED_4() -- Internal function, doesn't exist in bytecode
					var157 = tonumber(attribute_4:match("(%d+)"))
					return var157
				end
				if not var157 and (type(attribute_4) ~= "string" or not INLINED_4()) then
					var157 = 1
				end
				if not module_8[var157] then
				end
				module_8[var157] = {
					REG = {};
					ADS = {};
				}
				local Trans_3 = v_2:FindFirstChild("Trans")
				if var153 then
				else
				end
				local tbl_9 = {
					part = v_2;
					default = v_2.Transparency;
				}
				if not Trans_3 or not Trans_3:IsA("NumberValue") or not Trans_3.Value then
				end
				tbl_9.trans = nil
				table.insert(module_8[var157].ADS, tbl_9)
			end
		end
	end
	return module_8
end
local rad_upvr = math.rad
local random_upvr = math.random
local sin_upvr = math.sin
local cos_upvr = math.cos
local sqrt_upvr = math.sqrt
local function randomConeDirection_upvr(arg1, arg2) -- Line 644, Named "randomConeDirection"
	--[[ Upvalues[5]:
		[1]: rad_upvr (readonly)
		[2]: random_upvr (readonly)
		[3]: sin_upvr (readonly)
		[4]: cos_upvr (readonly)
		[5]: sqrt_upvr (readonly)
	]]
	if arg2 <= 0 then
		return arg1
	end
	local var166 = random_upvr() * 2 * math.pi
	local var167 = random_upvr() * rad_upvr(arg2)
	local var163_result1_2 = sin_upvr(var167)
	local var164_result1_2 = cos_upvr(var167)
	local var164_result1 = cos_upvr(var166)
	local var163_result1 = sin_upvr(var166)
	local var172
	local var173
	local var174
	if math.abs(arg1.Y) < 0.9 then
		var172 = -arg1.Z
		var173 = 0
		var174 = arg1.X
	else
		var172 = 1
		var173 = 0
		var174 = 0
	end
	local sqrt_upvr_result1 = sqrt_upvr(var172 * var172 + var173 * var173 + var174 * var174)
	local var176 = var172 / sqrt_upvr_result1
	local var177 = var173 / sqrt_upvr_result1
	local var178 = var174 / sqrt_upvr_result1
	return Vector3.new(arg1.X * var164_result1_2 + (var176 * var164_result1 + (arg1.Y * var178 - arg1.Z * var177) * var163_result1) * var163_result1_2, arg1.Y * var164_result1_2 + (var177 * var164_result1 + (arg1.Z * var176 - arg1.X * var178) * var163_result1) * var163_result1_2, arg1.Z * var164_result1_2 + (var178 * var164_result1 + (arg1.X * var177 - arg1.Y * var176) * var163_result1) * var163_result1_2).Unit
end
local function SetSuppressorVisibility_upvr(arg1) -- Line 687, Named "SetSuppressorVisibility"
	--[[ Upvalues[1]:
		[1]: tbl_16_upvr (readonly)
	]]
	-- KONSTANTERROR: [0] 1. Error Block 19 start (CF ANALYSIS FAILED)
	if not tbl_16_upvr.Assets or not tbl_16_upvr.Assets.GunModel then return end
	local Suppressor_4 = tbl_16_upvr.Assets.GunModel:FindFirstChild("Suppressor")
	-- KONSTANTERROR: [0] 1. Error Block 19 end (CF ANALYSIS FAILED)
	-- KONSTANTERROR: [21] 16. Error Block 27 start (CF ANALYSIS FAILED)
	local children_13 = Suppressor_4:IsA("BasePart")
	if children_13 then
		if arg1 then
			children_13 = 0
		else
			children_13 = 1
		end
		Suppressor_4.Transparency = children_13
		children_13 = tbl_16_upvr.Framework.Models.Client:FindFirstChild(tbl_16_upvr.Assets.GunModel.Name)
		if children_13 then
			local Suppressor = children_13:FindFirstChild("Suppressor", true)
			local var185
			if Suppressor then
				if arg1 then
					var185 = 0
				else
					var185 = 1
				end
				Suppressor.Transparency = var185
			end
		end
	end
	-- KONSTANTERROR: [21] 16. Error Block 27 end (CF ANALYSIS FAILED)
end
local function UnbindAllActions_upvr() -- Line 703, Named "UnbindAllActions"
	--[[ Upvalues[2]:
		[1]: tbl_16_upvr (readonly)
		[2]: tbl_6_upvr (readonly)
	]]
	for _, v_3 in pairs(tbl_16_upvr.BoundActionNames) do
		tbl_6_upvr.ContextActionService:UnbindAction(v_3)
	end
	table.clear(tbl_16_upvr.BoundActionNames)
end
local function _(arg1) -- Line 710, Named "SetChamberedState"
	--[[ Upvalues[1]:
		[1]: tbl_16_upvr (readonly)
	]]
	if tbl_16_upvr.ChamberedValue and tbl_16_upvr.ChamberedValue.Value ~= arg1 then
		tbl_16_upvr.ChamberedValue.Value = arg1
	end
	if tbl_16_upvr.currentTool then
		tbl_16_upvr.currentTool:SetAttribute("ChamberedAttr", arg1)
	end
end
local function CacheADSParts_upvr(arg1) -- Line 719, Named "CacheADSParts"
	--[[ Upvalues[2]:
		[1]: tbl_16_upvr (readonly)
		[2]: _collectADSParts_upvr (readonly)
	]]
	-- KONSTANTERROR: [0] 1. Error Block 16 start (CF ANALYSIS FAILED)
	local var198
	for i_5, _ in pairs(tbl_16_upvr.ADSMesh.groups) do
		var198 = tbl_16_upvr.ADSMesh
		var198 = nil
		var198.groups[i_5] = var198
	end
	tbl_16_upvr.ADSMesh.ready = false
	tbl_16_upvr.ADSMesh._lastOn = -1
	tbl_16_upvr.ADSMesh._lastGroup = -1
	if not arg1 then return end
	local _collectADSParts_upvr_result1 = _collectADSParts_upvr(arg1)
	tbl_16_upvr.ADSMesh.groups = _collectADSParts_upvr_result1
	local pairs_result1_8, pairs_result2_2, pairs_result3_5 = pairs(_collectADSParts_upvr_result1)
	-- KONSTANTERROR: [0] 1. Error Block 16 end (CF ANALYSIS FAILED)
	-- KONSTANTERROR: [64] 47. Error Block 8 start (CF ANALYSIS FAILED)
	-- KONSTANTERROR: [64] 47. Error Block 8 end (CF ANALYSIS FAILED)
	-- KONSTANTERROR: [52] 38. Error Block 6 start (CF ANALYSIS FAILED)
	-- KONSTANTWARNING: Failed to evaluate expression, replaced with nil [64.9]
	-- KONSTANTERROR: [52] 38. Error Block 6 end (CF ANALYSIS FAILED)
end
local function TFov_upvr(arg1) -- Line 734, Named "TFov"
	--[[ Upvalues[1]:
		[1]: tbl_16_upvr (readonly)
	]]
	-- KONSTANTWARNING: Variable analysis failed. Output will have some incorrect variable assignments
	-- KONSTANTERROR: [0] 1. Error Block 82 start (CF ANALYSIS FAILED)
	local Camera_4_upvr = tbl_16_upvr.Camera
	local Assets_2_upvr = tbl_16_upvr.Assets
	if Assets_2_upvr then
		Assets_2_upvr = tbl_16_upvr.Assets.AimBlur
	end
	if not Camera_4_upvr or not Assets_2_upvr then
	else
		-- KONSTANTERROR: [0] 1. Error Block 82 end (CF ANALYSIS FAILED)
		-- KONSTANTERROR: [25] 20. Error Block 79 start (CF ANALYSIS FAILED)
		local FieldOfView_2 = workspace:GetAttribute("FieldOfView")
		if not FieldOfView_2 then
			-- KONSTANTERROR: [32] 25. Error Block 10 start (CF ANALYSIS FAILED)
			FieldOfView_2 = 70
			-- KONSTANTERROR: [32] 25. Error Block 10 end (CF ANALYSIS FAILED)
		end
		-- KONSTANTERROR: [25] 20. Error Block 79 end (CF ANALYSIS FAILED)
		-- KONSTANTERROR: [33] 26. Error Block 110 start (CF ANALYSIS FAILED)
		local clamped_3_upvr = math.clamp(FieldOfView_2, 20, 120)
		if not tbl_16_upvr.Settings or not tbl_16_upvr.Settings.NormalMouseSensitivity then
		end
		if tbl_16_upvr.Aiming then
			local _ = 0.5
		else
		end
		if tbl_16_upvr._lpvoDriving then
			if 0.001 < math.abs(Camera_4_upvr.FieldOfView - clamped_3_upvr) then
				Camera_4_upvr.FieldOfView = clamped_3_upvr
			end
			if 0.001 < math.abs((Assets_2_upvr.InFocusRadius or 0) - 2) then
				-- KONSTANTERROR: Expression was reused, decompilation is incorrect
				Assets_2_upvr.InFocusRadius = 2
			end
			return
		end
		local _activeTweens_upvr = tbl_16_upvr.Assets._activeTweens
		if _activeTweens_upvr then
			_activeTweens_upvr = tbl_16_upvr.Assets._activeTweens.fov
		end
		if _activeTweens_upvr then
			pcall(function() -- Line 530
				--[[ Upvalues[1]:
					[1]: _activeTweens_upvr (readonly)
				]]
				_activeTweens_upvr:Cancel()
			end)
		end
		_activeTweens_upvr = tbl_16_upvr.Assets._activeTweens
		local var210_upvr = _activeTweens_upvr
		if var210_upvr then
			var210_upvr = tbl_16_upvr.Assets._activeTweens.dof
		end
		if var210_upvr then
			pcall(function() -- Line 530
				--[[ Upvalues[1]:
					[1]: var210_upvr (readonly)
				]]
				var210_upvr:Cancel()
			end)
		end
		if math.abs(Camera_4_upvr.FieldOfView - clamped_3_upvr) >= 0.001 then
			var210_upvr = false
		else
			var210_upvr = true
		end
		-- KONSTANTERROR: Expression was reused, decompilation is incorrect
		if math.abs((Assets_2_upvr.InFocusRadius or 0) - 2) >= 0.001 then
		else
			local var212
		end
		if var210_upvr and true then return end
		local _TI_upvr = tbl_16_upvr._TI
		if _TI_upvr then
			var212 = tbl_16_upvr
			_TI_upvr = var212._TI.FOV
		end
		var212 = tbl_16_upvr
		local _TI_upvr_2 = var212._TI
		if _TI_upvr_2 then
			var212 = tbl_16_upvr._TI
			_TI_upvr_2 = var212.DOF
		end
		local function INLINED_5() -- Internal function, doesn't exist in bytecode
			var212 = _TI_upvr.Time
			return var212
		end
		if not _TI_upvr or not INLINED_5() then
			var212 = 0
		end
		if not _TI_upvr_2 or not _TI_upvr_2.Time then
		end
		if var212 <= 0 then
			Camera_4_upvr.FieldOfView = clamped_3_upvr
		else
			local pcall_result1_6, pcall_result2_7 = pcall(function() -- Line 773
				--[[ Upvalues[4]:
					[1]: tbl_16_upvr (copied, readonly)
					[2]: Camera_4_upvr (readonly)
					[3]: _TI_upvr (readonly)
					[4]: clamped_3_upvr (readonly)
				]]
				return tbl_16_upvr.TweenService:Create(Camera_4_upvr, _TI_upvr, {
					FieldOfView = clamped_3_upvr;
				})
			end)
			if pcall_result1_6 and pcall_result2_7 then
				tbl_16_upvr.Assets._activeTweens.fov = pcall_result2_7
				tbl_16_upvr.ViewmodelJanitor:Add(pcall_result2_7, "Cancel")
				pcall_result2_7:Play()
			else
				Camera_4_upvr.FieldOfView = clamped_3_upvr
			end
		end
		if 0 <= 0 then
			-- KONSTANTERROR: Expression was reused, decompilation is incorrect
			Assets_2_upvr.InFocusRadius = 2
			return
		end
		local var220_upvr = 2
		local pcall_result1_5, pcall_result2_3 = pcall(function() -- Line 788
			--[[ Upvalues[4]:
				[1]: tbl_16_upvr (copied, readonly)
				[2]: Assets_2_upvr (readonly)
				[3]: _TI_upvr_2 (readonly)
				[4]: var220_upvr (readonly)
			]]
			return tbl_16_upvr.TweenService:Create(Assets_2_upvr, _TI_upvr_2, {
				InFocusRadius = var220_upvr;
			})
		end)
		if pcall_result1_5 and pcall_result2_3 then
			tbl_16_upvr.Assets._activeTweens.dof = pcall_result2_3
			tbl_16_upvr.ViewmodelJanitor:Add(pcall_result2_3, "Cancel")
			pcall_result2_3:Play()
			return
		end
		Assets_2_upvr.InFocusRadius = var220_upvr
		-- KONSTANTERROR: [33] 26. Error Block 110 end (CF ANALYSIS FAILED)
	end
end
tbl_16_upvr.TFov = TFov_upvr
_G.__TFovHook = TFov_upvr
local function SetClientAttachmentVisible_upvr(arg1, arg2) -- Line 804, Named "SetClientAttachmentVisible"
	--[[ Upvalues[1]:
		[1]: tbl_16_upvr (readonly)
	]]
	-- KONSTANTWARNING: Variable analysis failed. Output will have some incorrect variable assignments
	if not tbl_16_upvr.Assets or not tbl_16_upvr.Assets.GunModel then
	else
		for _, v_35 in ipairs(tbl_16_upvr.Assets.GunModel:GetDescendants()) do
			local var235
			if var235 then
				var235 = v_35.Name
				local var236
				local function INLINED_6() -- Internal function, doesn't exist in bytecode
					var235 = v_35:GetAttribute("MeshRole")
					return var235 == arg1
				end
				local function INLINED_7() -- Internal function, doesn't exist in bytecode
					var235 = v_35:FindFirstChildOfClass("Decal")
					v_35.Transparency = var235
					if arg2 then
						var235 = 0
					else
						var235 = 1
					end
					return var235
				end
				if var235 == arg1 or INLINED_6() or INLINED_7() then
					if arg2 then
					else
					end
					var235.Transparency = 1
				end
			end
		end
	end
end
local function UpdateRocketVisibility_upvr(arg1) -- Line 815, Named "UpdateRocketVisibility"
	--[[ Upvalues[2]:
		[1]: tbl_16_upvr (readonly)
		[2]: SetClientAttachmentVisible_upvr (readonly)
	]]
	-- KONSTANTWARNING: Variable analysis failed. Output will have some incorrect variable assignments
	local var264
	local function INLINED_11() -- Internal function, doesn't exist in bytecode
		var264 = tbl_16_upvr.Assets
		return var264.GunModel
	end
	if not tbl_16_upvr.Assets or not INLINED_11() then
	else
		var264 = tbl_16_upvr.Assets
		local function INLINED_12() -- Internal function, doesn't exist in bytecode
			var264 = tbl_16_upvr.Assets.SettingsGun
			return var264.Rocket
		end
		if not var264.SettingsGun or not INLINED_12() then return end
		if arg1 ~= nil then
			local _ = arg1
		else
			var264 = tbl_16_upvr.currentTool
			if var264 then
				var264 = tbl_16_upvr.currentTool:FindFirstChild("WeaponModules")
				if var264 then
					var264 = tbl_16_upvr.currentTool.WeaponModules:FindFirstChild("Variables")
					local var266 = var264
				end
			end
			if var266 then
				local RocketInserted_5 = var266:FindFirstChild("RocketInserted")
				if RocketInserted_5 then
				end
			end
			if tbl_16_upvr.ChamberedValue then
				local Value_3 = RocketInserted_5.Value
				if not Value_3 then
					Value_3 = tbl_16_upvr.ChamberedValue.Value
				end
			end
			if tbl_16_upvr.AmmoValue and 0 < tbl_16_upvr.AmmoValue.Value then
			end
		end
		var266 = SetClientAttachmentVisible_upvr
		var266("RocketMesh", true)
		var266 = tbl_16_upvr.Assets.GunModel:FindFirstChild("Warhead")
		local var269 = var266
		if var269 then
			local children_8 = var269:IsA("BasePart")
			if children_8 then
				-- KONSTANTERROR: Expression was reused, decompilation is incorrect
				if true then
					children_8 = 0
				else
					children_8 = 1
				end
				var269.Transparency = children_8
			end
		end
		for _, v_36 in ipairs(tbl_16_upvr.Assets.GunModel:GetDescendants()) do
			local var274
			local function INLINED_13() -- Internal function, doesn't exist in bytecode
				local MeshRole_3 = v_36:GetAttribute("MeshRole")
				return MeshRole_3 == "RocketMesh"
			end
			if v_36:IsA("BasePart") and (INLINED_13() or MeshRole_3 == "Projectile" or v_36.Name == "Rocket") then
				-- KONSTANTERROR: Expression was reused, decompilation is incorrect
				if true then
				else
				end
				v_36.Transparency = 1
			end
		end
	end
end
local function SetProjectorSightVisible_upvr(arg1) -- Line 861, Named "SetProjectorSightVisible"
	--[[ Upvalues[1]:
		[1]: tbl_16_upvr (readonly)
	]]
	-- KONSTANTERROR: [33] 27. Error Block 91 start (CF ANALYSIS FAILED)
	-- KONSTANTWARNING: Failed to evaluate expression, replaced with nil [34.2]
	if nil:IsA("Model") then
		for _, v_5 in pairs(nil:GetDescendants()) do
			if v_5:IsA("BasePart") then
				local IsReticle_2 = v_5:GetAttribute("IsReticle")
				if IsReticle_2 then
					if arg1 then
						IsReticle_2 = 0
					else
						IsReticle_2 = 1
					end
					v_5.Transparency = IsReticle_2
				end
			end
		end
		-- KONSTANTWARNING: Failed to evaluate expression, replaced with nil [63.1]
		nil(nil)
	end
	-- KONSTANTERROR: [33] 27. Error Block 91 end (CF ANALYSIS FAILED)
	-- KONSTANTERROR: [0] 1. Error Block 97 start (CF ANALYSIS FAILED)
	-- KONSTANTERROR: Expression was reused, decompilation is incorrect
	if nil then
		if not nil(nil) then
			-- KONSTANTWARNING: GOTO [33] #27
		end
		-- KONSTANTERROR: Expression was reused, decompilation is incorrect
		if not nil(nil) then
			-- KONSTANTERROR: Expression was reused, decompilation is incorrect
			if nil(nil) == "Reticle" then
				if arg1 then
				else
				end
				-- KONSTANTWARNING: GOTO [66] #53
			end
			-- KONSTANTWARNING: GOTO [66] #53
		end
		-- KONSTANTWARNING: GOTO [26] #21
	end
	-- KONSTANTERROR: [0] 1. Error Block 97 end (CF ANALYSIS FAILED)
	-- KONSTANTERROR: [66] 53. Error Block 90 start (CF ANALYSIS FAILED)
	if tbl_16_upvr.Assets and tbl_16_upvr.Assets.GunModel then
		local ProjectorSight = tbl_16_upvr.Assets.GunModel:FindFirstChild("ProjectorSight", true)
		local function INLINED_16() -- Internal function, doesn't exist in bytecode
			nil(ProjectorSight)
			-- KONSTANTERROR: Expression was reused, decompilation is incorrect
			return ProjectorSight:IsA("BasePart")
		end
		if ProjectorSight and INLINED_16() and (ProjectorSight:GetAttribute("IsReticle") or ProjectorSight.Name == "ProjectorSight") then
			for _, v_6 in pairs(ProjectorSight:GetChildren()) do
				IsReticle_2 = v_6:IsA("SurfaceGui")
				local function INLINED_17() -- Internal function, doesn't exist in bytecode
					IsReticle_2 = v_6:IsA("BillboardGui")
					return IsReticle_2
				end
				if IsReticle_2 or INLINED_17() then
					v_6.Enabled = arg1
				end
			end
		end
		local Reticle_4 = tbl_16_upvr.Assets.GunModel:FindFirstChild("Reticle", true)
		if Reticle_4 then
			-- KONSTANTERROR: Expression was reused, decompilation is incorrect
			nil(Reticle_4)
			local children_9 = Reticle_4:IsA("BasePart")
			if children_9 then
				if arg1 then
					children_9 = 0
				else
					children_9 = 1
				end
				Reticle_4.Transparency = children_9
			end
		end
		local Sights_2 = tbl_16_upvr.Assets.GunModel:FindFirstChild("Sights")
		if Sights_2 then
			for _, v_7 in pairs(Sights_2:GetChildren()) do
				local AimPart_2 = v_7:FindFirstChild("AimPart")
				if AimPart_2 then
					local ProjectorSight_2 = AimPart_2:FindFirstChild("ProjectorSight")
					if ProjectorSight_2 then
						-- KONSTANTERROR: Expression was reused, decompilation is incorrect
						nil(ProjectorSight_2)
					end
					local Reticle_2 = AimPart_2:FindFirstChild("Reticle")
					if Reticle_2 then
						-- KONSTANTERROR: Expression was reused, decompilation is incorrect
						nil(Reticle_2)
						local children_4 = Reticle_2:IsA("BasePart")
						if children_4 then
							if arg1 then
								children_4 = 0
							else
								children_4 = 1
							end
							Reticle_2.Transparency = children_4
						end
					end
				end
			end
		end
	end
	-- KONSTANTERROR: [66] 53. Error Block 90 end (CF ANALYSIS FAILED)
end
local function RefreshInsertVisuals_upvr() -- Line 938, Named "RefreshInsertVisuals"
	--[[ Upvalues[2]:
		[1]: tbl_16_upvr (readonly)
		[2]: SetClientAttachmentVisible_upvr (readonly)
	]]
	-- KONSTANTWARNING: Variable analysis failed. Output will have some incorrect variable assignments
	local currentTool_4 = tbl_16_upvr.currentTool
	if currentTool_4 then
		currentTool_4 = tbl_16_upvr.currentTool:FindFirstChild("WeaponModules")
		if currentTool_4 then
			currentTool_4 = tbl_16_upvr.currentTool.WeaponModules:FindFirstChild("Variables")
		end
	end
	if not currentTool_4 then
	else
		if not currentTool_4:FindFirstChild("MagInserted") or not currentTool_4.MagInserted.Value then
		end
		if currentTool_4:FindFirstChild("RocketInserted") then
		end
		local var344
		if tbl_16_upvr.Assets and tbl_16_upvr.Assets.SettingsGun then
			if tbl_16_upvr.Assets.SettingsGun.Rocket and not var344 then
				if tbl_16_upvr.ChamberedValue and tbl_16_upvr.ChamberedValue.Value then
					var344 = true
				end
				if tbl_16_upvr.AmmoValue and 0 < tbl_16_upvr.AmmoValue.Value then
					var344 = true
				end
			end
		end
		SetClientAttachmentVisible_upvr("MagMesh", false)
		SetClientAttachmentVisible_upvr("RocketMesh", var344)
		if tbl_16_upvr.Assets then
			if tbl_16_upvr.Assets.GunModel then
				local Warhead = tbl_16_upvr.Assets.GunModel:FindFirstChild("Warhead")
				if Warhead then
					local children_12 = Warhead:IsA("BasePart")
					if children_12 then
						if var344 then
							children_12 = 0
						else
							children_12 = 1
						end
						Warhead.Transparency = children_12
					end
				end
			end
		end
	end
end
local function CacheMuzzleFX_upvr(arg1) -- Line 974, Named "CacheMuzzleFX"
	--[[ Upvalues[1]:
		[1]: tbl_16_upvr (readonly)
	]]
	tbl_16_upvr.muzzleEmitters = {}
	tbl_16_upvr.muzzleEmittersList = {}
	tbl_16_upvr.muzzleLights = {}
	tbl_16_upvr.muzzleLightsList = {}
	tbl_16_upvr.SupmuzzleEmittersList = {}
	if not arg1 then
	else
		for _, v_37 in ipairs(arg1:GetDescendants()) do
			if v_37:IsA("ParticleEmitter") then
				local Name_10 = v_37.Name
				if Name_10:find("Flash") then
					v_37.Enabled = false
					tbl_16_upvr.muzzleEmitters.Flash = v_37
					table.insert(tbl_16_upvr.muzzleEmittersList, v_37)
				elseif Name_10:find("Particles") then
					v_37.Enabled = false
					tbl_16_upvr.muzzleEmitters.Sparks = v_37
				elseif Name_10:find("Smoke") then
					v_37.Enabled = true
					v_37.Rate = 0
					if not tbl_16_upvr.muzzleEmitters.HotSmoke then
						tbl_16_upvr.muzzleEmitters.HotSmoke = v_37
					end
					table.insert(tbl_16_upvr.muzzleEmittersList, v_37)
				else
					v_37.Enabled = false
					table.insert(tbl_16_upvr.muzzleEmittersList, v_37)
				end
			elseif v_37:IsA("Light") then
				if v_37.Name:find("Muzzle") then
					tbl_16_upvr.muzzleLights.MuzzleLight = v_37
				end
				table.insert(tbl_16_upvr.muzzleLightsList, v_37)
			end
		end
		local Suppressor_SmokePart = tbl_16_upvr.Assets.GunModel:FindFirstChild("Suppressor_SmokePart")
		if Suppressor_SmokePart then
			for _, v_38 in ipairs(Suppressor_SmokePart:GetDescendants()) do
				if v_38:IsA("ParticleEmitter") and v_38.Name:find("Smoke") then
					v_38.Enabled = true
					v_38.Rate = 0
					if not tbl_16_upvr.SupmuzzleEmittersList.HotSmoke then
						tbl_16_upvr.SupmuzzleEmittersList.HotSmoke = v_38
					end
					table.insert(tbl_16_upvr.SupmuzzleEmittersList, v_38)
				end
			end
		end
	end
end
local function EjectShellNow_upvr() -- Line 1027, Named "EjectShellNow"
	--[[ Upvalues[1]:
		[1]: tbl_16_upvr (readonly)
	]]
	-- KONSTANTERROR: [0] 1. Error Block 24 start (CF ANALYSIS FAILED)
	if not tbl_16_upvr.Modules.ShellEject then return end
	if not tbl_16_upvr.Assets or not tbl_16_upvr.Assets.GunModel then return end
	-- KONSTANTERROR: [0] 1. Error Block 24 end (CF ANALYSIS FAILED)
	-- KONSTANTERROR: [22] 17. Error Block 8 start (CF ANALYSIS FAILED)
	-- KONSTANTERROR: [22] 17. Error Block 8 end (CF ANALYSIS FAILED)
	-- KONSTANTERROR: [27] 20. Error Block 9 start (CF ANALYSIS FAILED)
	-- KONSTANTERROR: [27] 20. Error Block 9 end (CF ANALYSIS FAILED)
end
local function CacheChamberFX_upvr(arg1) -- Line 1041, Named "CacheChamberFX"
	--[[ Upvalues[1]:
		[1]: tbl_16_upvr (readonly)
	]]
	tbl_16_upvr.chamber = {
		port = nil;
		smoke = nil;
	}
	if not arg1 then
	else
		local EjectPort = arg1:FindFirstChild("EjectPort", true)
		tbl_16_upvr.chamber.port = EjectPort
		if not EjectPort then return end
		local Smoke = EjectPort:FindFirstChild("Smoke")
		if Smoke and Smoke:IsA("ParticleEmitter") then
			tbl_16_upvr.chamber.smoke = Smoke
			Smoke.Enabled = false
			Smoke.LockedToPart = true
			Smoke.Rate = 0
		end
	end
end
local function ChamberFX_upvr() -- Line 1058, Named "ChamberFX"
	--[[ Upvalues[1]:
		[1]: tbl_16_upvr (readonly)
	]]
	-- KONSTANTWARNING: Variable analysis failed. Output will have some incorrect variable assignments
	-- KONSTANTERROR: [0] 1. Error Block 1 start (CF ANALYSIS FAILED)
	local chamber = tbl_16_upvr.chamber
	local var363
	-- KONSTANTERROR: [0] 1. Error Block 1 end (CF ANALYSIS FAILED)
	-- KONSTANTERROR: [4] 4. Error Block 66 start (CF ANALYSIS FAILED)
	if not chamber.port or not chamber.smoke then
		-- KONSTANTERROR: [10] 8. Error Block 4 start (CF ANALYSIS FAILED)
		do
			return
		end
		-- KONSTANTERROR: [10] 8. Error Block 4 end (CF ANALYSIS FAILED)
	end
	local Camera_3 = tbl_16_upvr.Camera
	if not Camera_3 then
	else
		var363 = tbl_16_upvr.Settings.MuzzleFXMaxDistance
		var363 = (Camera_3.CFrame.Position - chamber.port.Position).Magnitude
		if (var363 or 200) < var363 then return end
		local currentTool_5 = tbl_16_upvr.currentTool
		if not currentTool_5 then
			var363 = nil
		else
			if not tbl_16_upvr.PerToolState[currentTool_5] then
				local var367 = {
					nextShotTime = 0;
					lastShotAt = 0;
					rapidStreak = 0;
					Overheated = false;
					Heat = 0;
				}
				tbl_16_upvr.PerToolState[currentTool_5] = var367
			end
			var363 = var367
		end
		if not var363 then
		end
		currentTool_5 = tbl_16_upvr.Assets._suppressorVar
		local var368 = currentTool_5
		if var368 then
			if tbl_16_upvr.Assets._suppressorVar.Value ~= true then
				var368 = false
			else
				var368 = true
			end
		end
		if tbl_16_upvr.humanoid then
			if tbl_16_upvr.humanoid.FloorMaterial ~= Enum.Material.Water then
			else
			end
		end
		if 0 >= tbl_16_upvr.MaxHeat or not math.clamp((({}).Heat or 0) / tbl_16_upvr.MaxHeat, 0, 1) then
		end
		if true then
		else
		end
		if var368 then
		else
		end
		local clamped_6 = math.clamp(math.floor(2 + (6) * (1 * 1 * (0.6 + 1.2 * 0))), 0, 12)
		if 0 < clamped_6 then
			chamber.smoke:Emit(clamped_6)
		end
		-- KONSTANTERROR: [4] 4. Error Block 66 end (CF ANALYSIS FAILED)
	end
end
local function MuzzleFXFunc_upvr(arg1, arg2) -- Line 1076, Named "MuzzleFXFunc"
	--[[ Upvalues[1]:
		[1]: tbl_16_upvr (readonly)
	]]
	if not arg1 or not tbl_16_upvr.Camera then
	else
		if tbl_16_upvr.humanoid then
			if tbl_16_upvr.humanoid.FloorMaterial ~= Enum.Material.Water then
			else
			end
		end
		if 200 < (tbl_16_upvr.Camera.CFrame.Position - arg1.Position).Magnitude then return end
		local FlashFX_Particles__2 = arg1:FindFirstChild("FlashFX[Particles]")
		local var375
		if FlashFX_Particles__2 then
			if true then
				var375 = 0
			elseif arg2 then
				var375 = 1
			else
				var375 = math.random(3, 4)
			end
			if 0 < var375 then
				FlashFX_Particles__2:Emit(var375)
			end
		end
		local var376 = "Smoke"
		local SOME_11 = arg1:FindFirstChild(var376)
		local var378
		if SOME_11 then
			if arg2 then
				var376 = 0.55
			else
				var376 = 1
			end
			-- KONSTANTERROR: Expression was reused, decompilation is incorrect
			if true then
				var378 = 0.2
			else
				var378 = 1
			end
			var378 = math.floor((24) * (var376 * var378))
			var376 = math.clamp(var378, 0, 24)
			var378 = 0
			if var378 < var376 then
				var378 = SOME_11:Emit
				var378(var376)
			end
		end
	end
end
local function _(arg1, arg2) -- Line 1102, Named "safeGet"
	if arg1 == nil then
		return nil
	end
	return arg1[arg2]
end
local function MuzzleFX_upvr(arg1) -- Line 1107, Named "MuzzleFX"
	--[[ Upvalues[4]:
		[1]: tbl_16_upvr (readonly)
		[2]: GetToolState_upvr (readonly)
		[3]: EjectShellNow_upvr (readonly)
		[4]: ChamberFX_upvr (readonly)
	]]
	-- KONSTANTERROR: [0] 1. Error Block 145 start (CF ANALYSIS FAILED)
	local var379
	local function INLINED_19() -- Internal function, doesn't exist in bytecode
		var379 = type(tbl_16_upvr)
		return var379 ~= "table"
	end
	if not var379 or INLINED_19() then return end
	var379 = tbl_16_upvr.muzzle
	local function INLINED_20() -- Internal function, doesn't exist in bytecode
		var379 = tbl_16_upvr.Camera
		return var379
	end
	local function INLINED_21() -- Internal function, doesn't exist in bytecode
		var379 = tbl_16_upvr.currentTool
		return var379
	end
	if not var379 or not INLINED_20() or not INLINED_21() then return end
	local function INLINED_22() -- Internal function, doesn't exist in bytecode
		var379 = tbl_16_upvr.Settings.MuzzleFXMaxDistance
		return var379
	end
	if not tbl_16_upvr.Settings or not INLINED_22() then
		var379 = 200
	end
	-- KONSTANTERROR: [0] 1. Error Block 145 end (CF ANALYSIS FAILED)
	-- KONSTANTERROR: [51] 37. Error Block 148 start (CF ANALYSIS FAILED)
	if tbl_16_upvr.Modules then
		if tbl_16_upvr.Modules.SoundHandle and tbl_16_upvr.Modules.SoundHandle.FireSound then
			tbl_16_upvr.Modules.SoundHandle:FireSound(tbl_16_upvr.muzzle, tbl_16_upvr.currentTool, tbl_16_upvr.Assets.SettingsGun.SoundFolder)
		end
	end
	do
		return
	end
	-- KONSTANTERROR: [51] 37. Error Block 148 end (CF ANALYSIS FAILED)
end
local function _(arg1) -- Line 1208, Named "heatFrac"
	--[[ Upvalues[1]:
		[1]: tbl_16_upvr (readonly)
	]]
	local var380
	local function INLINED_23() -- Internal function, doesn't exist in bytecode
		var380 = math.max(0, arg1.Heat or 0) / tbl_16_upvr.MaxHeat
		return var380
	end
	if 0 >= tbl_16_upvr.MaxHeat or not INLINED_23() then
		var380 = 0
	end
	return var380
end
local function _(arg1) -- Line 1213, Named "zoneOf"
	--[[ Upvalues[1]:
		[1]: tbl_16_upvr (readonly)
	]]
	if 1 <= arg1 then
		return "over"
	end
	if (tbl_16_upvr.OH.CRIT or 0.9) <= arg1 then
		return "crit"
	end
	if (tbl_16_upvr.OH.HOT or 0.7) <= arg1 then
		return "hot"
	end
	if (tbl_16_upvr.OH.WARM or 0.4) <= arg1 then
		return "warm"
	end
	return "cool"
end
local function _() -- Line 1221, Named "isUnderwater"
	--[[ Upvalues[1]:
		[1]: tbl_16_upvr (readonly)
	]]
	-- KONSTANTERROR: [0] 1. Error Block 1 start (CF ANALYSIS FAILED)
	-- KONSTANTERROR: [0] 1. Error Block 1 end (CF ANALYSIS FAILED)
	-- KONSTANTERROR: [4] 4. Error Block 6 start (CF ANALYSIS FAILED)
	local var381 = true
	if tbl_16_upvr.humanoid.FloorMaterial ~= Enum.Material.Water then
		-- KONSTANTERROR: [14] 10. Error Block 3 start (CF ANALYSIS FAILED)
		var381 = false
		-- KONSTANTERROR: [14] 10. Error Block 3 end (CF ANALYSIS FAILED)
	end
	do
		return var381
	end
	-- KONSTANTERROR: [4] 4. Error Block 6 end (CF ANALYSIS FAILED)
end
local function softThrottleFactor_upvr(arg1) -- Line 1225, Named "softThrottleFactor"
	--[[ Upvalues[1]:
		[1]: tbl_16_upvr (readonly)
	]]
	local var382 = tbl_16_upvr.OH.HOT or 0.7
	local var383 = tbl_16_upvr.OH.CRIT or 0.9
	if var383 <= arg1 then
		return tbl_16_upvr.OH.CritDelayFrac or 0.45
	end
	if var382 <= arg1 then
		return (tbl_16_upvr.OH.HotDelayFrac or 0.2) + ((tbl_16_upvr.OH.CritDelayFrac or 0.45) - (tbl_16_upvr.OH.HotDelayFrac or 0.2)) * ((arg1 - var382) / math.max(0.000001, var383 - var382))
	end
	return 0
end
local function _(arg1, arg2) -- Line 1238, Named "nonLinearCooling"
	return arg2 * (math.sqrt(math.clamp(arg1, 0, 1)) * 0.4 + 0.6)
end
local function _(arg1, arg2, arg3, arg4) -- Line 1242, Named "_smooth"
	return arg1 + (arg2 - arg1) * (1 - math.exp(-arg3 * arg4))
end
local function notifyZoneChange_upvr(arg1, arg2) -- Line 1246, Named "notifyZoneChange"
	--[[ Upvalues[1]:
		[1]: tbl_16_upvr (readonly)
	]]
	if arg1 == arg2 then
	else
		if arg2 == "warm" then
			tbl_16_upvr.Modules.SystemSFX.Play("HeatWarmup", tbl_16_upvr.Assets.GunModel)
			return
		end
		if arg2 == "hot" then
			tbl_16_upvr.Modules.SystemSFX.Play("HeatWarmup", tbl_16_upvr.Assets.GunModel)
			return
		end
		if arg2 == "crit" then
			tbl_16_upvr.Modules.SystemSFX.Play("HeatCrit", tbl_16_upvr.Assets.GunModel)
			return
		end
		if arg2 == "over" then
			tbl_16_upvr.Modules.SystemSFX.Play("OverheatLock", tbl_16_upvr.Assets.GunModel)
		end
	end
end
local function applyHeatCosmetics_upvr(arg1) -- Line 1259, Named "applyHeatCosmetics"
	--[[ Upvalues[1]:
		[1]: tbl_16_upvr (readonly)
	]]
	-- KONSTANTERROR: [0] 1. Error Block 1 start (CF ANALYSIS FAILED)
	-- KONSTANTERROR: [0] 1. Error Block 1 end (CF ANALYSIS FAILED)
	-- KONSTANTERROR: [6] 5. Error Block 2 start (CF ANALYSIS FAILED)
	-- KONSTANTERROR: [6] 5. Error Block 2 end (CF ANALYSIS FAILED)
	-- KONSTANTERROR: [8] 6. Error Block 3 start (CF ANALYSIS FAILED)
	-- KONSTANTERROR: [8] 6. Error Block 3 end (CF ANALYSIS FAILED)
end
local function totalmodes_upvr() -- Line 1291, Named "totalmodes"
	--[[ Upvalues[1]:
		[1]: tbl_16_upvr (readonly)
	]]
	-- KONSTANTERROR: [0] 1. Error Block 15 start (CF ANALYSIS FAILED)
	local var388
	if not var388 then
		var388 = 1
		return var388
	end
	var388 = 0
	local ipairs_result1_2, ipairs_result2_9, ipairs_result3_4 = ipairs(tbl_16_upvr.Assets.GunModel:GetChildren())
	for _, v_8 in ipairs_result1_2, ipairs_result2_9, ipairs_result3_4 do
		if v_8.Name:lower():find("aimpart") and not v_8.Name:lower():find("hided") then
			var388 += 1
		end
	end
	-- KONSTANTERROR: [0] 1. Error Block 15 end (CF ANALYSIS FAILED)
	-- KONSTANTERROR: [47] 34. Error Block 17 start (CF ANALYSIS FAILED)
	ipairs_result1_2 = var388
	local var392 = ipairs_result1_2
	if not var392 then
		-- KONSTANTERROR: [49] 36. Error Block 10 start (CF ANALYSIS FAILED)
		var392 = 1
		-- KONSTANTERROR: [49] 36. Error Block 10 end (CF ANALYSIS FAILED)
	end
	do
		return var392
	end
	-- KONSTANTERROR: [47] 34. Error Block 17 end (CF ANALYSIS FAILED)
end
function CheckIsTable(arg1, arg2) -- Line 1302
	for i_10, _ in pairs(arg1) do
		if i_10 == arg2 then
			return true
		end
	end
	return false
end
tbl_16_upvr.Remotes.GetIt.OnClientInvoke = function(arg1) -- Line 1311
	--[[ Upvalues[1]:
		[1]: tbl_16_upvr (readonly)
	]]
	pcall(function() -- Line 1312
		--[[ Upvalues[1]:
			[1]: tbl_16_upvr (copied, readonly)
		]]
		if not tbl_16_upvr.Assets.GunModel then
			return nil
		end
		local module = {
			Sights = "";
			Additionals = {"", ""};
			Suppressors = "";
			Grips = "";
			IronSight = false;
		}
		for _, v_10 in pairs(tbl_16_upvr.Assets.GunModel.Attachments:GetDescendants()) do
			if v_10:IsA("StringValue") then
				if v_10.Value ~= "" then
					local Name_9 = v_10.Parent.Name
					if Name_9:lower() == "additional" then
						module.Additionals[1] = v_10.Value
					elseif Name_9:lower() == "additional_2" then
						module.Additionals[2] = v_10.Value
					elseif CheckIsTable(module, v_10.Parent.Name..'s') then
						module[v_10.Parent.Name..'s'] = v_10.Value
					end
				end
			end
		end
		if tbl_16_upvr.Assets.GunModel.Attachments.IronSight.Transparent.Value == true then
			module.IronSight = true
			return module
		end
		module.IronSight = false
		return module
	end)
end
local function FindCurrentAimPart_upvr(arg1) -- Line 1344, Named "FindCurrentAimPart"
	--[[ Upvalues[2]:
		[1]: tbl_16_upvr (readonly)
		[2]: totalmodes_upvr (readonly)
	]]
	-- KONSTANTWARNING: Variable analysis failed. Output will have some incorrect variable assignments
	local var420
	if not var420 then
		var420 = nil
		return var420
	end
	var420 = tbl_16_upvr.AimMode
	if arg1 ~= nil then
		var420 = tbl_16_upvr.AimMode - 1
		if var420 == 0 then
			var420 = totalmodes_upvr()
		end
	end
	if var420 == 1 then
	else
	end
	local SOME_6 = tbl_16_upvr.Assets.GunModel:FindFirstChild("AimPart"..var420)
	if not SOME_6 then
		local var422
		for i_12 = 1, totalmodes_upvr() do
			if i_12 == 1 then
				var422 = "AimPart"
			else
				var422 = "AimPart"..i_12
			end
			local SOME_3 = tbl_16_upvr.Assets.GunModel:FindFirstChild(var422)
			if SOME_3 then
				tbl_16_upvr.AimMode = i_12
				return SOME_3
			end
		end
	end
	return SOME_6
end
local function _tweenTrans_upvr(arg1, arg2) -- Line 1371, Named "_tweenTrans"
	--[[ Upvalues[2]:
		[1]: tbl_16_upvr (readonly)
		[2]: tbl_6_upvr (readonly)
	]]
	if not arg1 or not arg1.Parent then
	else
		if math.abs((arg1.Transparency or 0) - arg2) < 0.001 then return end
		if tbl_16_upvr.Assets._activeTweens then
			if tbl_16_upvr.Assets._activeTweens.ads then
				local var428_upvr = tbl_16_upvr.Assets._activeTweens.ads[arg1]
				if var428_upvr then
					pcall(function() -- Line 1378
						--[[ Upvalues[1]:
							[1]: var428_upvr (readonly)
						]]
						var428_upvr:Cancel()
					end)
					tbl_16_upvr.Assets._activeTweens.ads[arg1] = nil
				end
			end
		end
		var428_upvr = tbl_6_upvr.Tween
		if not tbl_16_upvr._TI_ADS then
		end
		local tbl_7 = {}
		tbl_7.Transparency = arg2
		var428_upvr = var428_upvr:Create(arg1, TweenInfo.new(0.1), tbl_7)
		local var431_upvr = var428_upvr
		if tbl_16_upvr.Assets._activeTweens and tbl_16_upvr.Assets._activeTweens.ads then
			tbl_16_upvr.Assets._activeTweens.ads[arg1] = var431_upvr
		end
		var431_upvr:Play()
		var431_upvr.Completed:Once(function() -- Line 1390
			--[[ Upvalues[3]:
				[1]: tbl_16_upvr (copied, readonly)
				[2]: arg1 (readonly)
				[3]: var431_upvr (readonly)
			]]
			if tbl_16_upvr.Assets._activeTweens and tbl_16_upvr.Assets._activeTweens.ads then
				if tbl_16_upvr.Assets._activeTweens.ads[arg1] == var431_upvr then
					tbl_16_upvr.Assets._activeTweens.ads[arg1] = nil
				end
			end
		end)
	end
end
local function adsmeshhelper_upvr() -- Line 1399, Named "adsmeshhelper"
	--[[ Upvalues[2]:
		[1]: tbl_16_upvr (readonly)
		[2]: FindCurrentAimPart_upvr (readonly)
	]]
	if not tbl_16_upvr.Assets.GunModel then return end
	if not tbl_16_upvr.AimMode then return end
	local module_10 = {
		Show = {};
		Hide = {};
	}
	local module_3 = {
		Show = {};
		Hide = {};
	}
	for i_13, v_11 in ipairs(tbl_16_upvr.Assets.GunModel:GetChildren()) do
		if v_11:IsA("BasePart") then
			if v_11.Name == "REG" then
				table.insert(module_10.Hide, v_11)
				table.insert(module_3.Hide, v_11)
			elseif v_11.Name == "ADS" then
				table.insert(module_10.Show, v_11)
				table.insert(module_3.Show, v_11)
			end
		end
	end
	local FindCurrentAimPart_result1 = FindCurrentAimPart_upvr()
	if FindCurrentAimPart_result1 then
		i_13 = "ADS"
		if FindCurrentAimPart_result1:FindFirstChild(i_13) then
			local ADS_2 = FindCurrentAimPart_result1.ADS
			v_11 = "Hide"
			if ADS_2:FindFirstChild(v_11) then
				i_13 = ADS_2.Hide:GetChildren()
				local ipairs_result1_5, ipairs_result2_19, ipairs_result3_22 = ipairs(i_13)
				for _, v_12 in ipairs_result1_5, ipairs_result2_19, ipairs_result3_22 do
					if v_12:IsA("ObjectValue") and v_12.Value then
						table.insert(module_10.Hide, v_12.Value)
					end
				end
			end
			ipairs_result3_22 = "Show"
			if ADS_2:FindFirstChild(ipairs_result3_22) then
				ipairs_result2_19 = ADS_2.Show:GetChildren()
				local ipairs_result1_7, ipairs_result2_16, ipairs_result3_5 = ipairs(ipairs_result2_19)
				for _, v_13 in ipairs_result1_7, ipairs_result2_16, ipairs_result3_5 do
					if v_13:IsA("ObjectValue") and v_13.Value then
						table.insert(module_10.Show, v_13.Value)
					end
				end
			end
		end
	end
	local FindCurrentAimPart_upvr_result1 = FindCurrentAimPart_upvr("Prev")
	if FindCurrentAimPart_upvr_result1 then
		ipairs_result3_5 = "ADS"
		if FindCurrentAimPart_upvr_result1:FindFirstChild(ipairs_result3_5) then
			local _ = FindCurrentAimPart_upvr_result1.ADS
			ipairs_result2_16 = _:FindFirstChild("Hide")
			if ipairs_result2_16 then
				ipairs_result2_16 = ipairs
				ipairs_result3_5 = _.Hide:GetChildren()
				ipairs_result2_16 = ipairs_result2_16(ipairs_result3_5)
				local var485_result1, var485_result2, ipairs_result2_16_result3 = ipairs_result2_16(ipairs_result3_5)
				for _, v_14 in var485_result1, var485_result2, ipairs_result2_16_result3 do
					if v_14:IsA("ObjectValue") and v_14.Value then
						table.insert(module_3.Hide, v_14.Value)
					end
				end
			end
			var485_result1 = _:FindFirstChild("Show")
			if var485_result1 then
				var485_result1 = ipairs
				var485_result2 = _.Show:GetChildren()
				var485_result1 = var485_result1(var485_result2)
				for _, v_15 in var485_result1(var485_result2) do
					if v_15:IsA("ObjectValue") and v_15.Value then
						table.insert(module_3.Show, v_15.Value)
					end
				end
			end
		end
	end
	return module_10, module_3
end
local function DoAdsMesh_upvr(arg1) -- Line 1459, Named "DoAdsMesh"
	--[[ Upvalues[3]:
		[1]: tbl_16_upvr (readonly)
		[2]: adsmeshhelper_upvr (readonly)
		[3]: _tweenTrans_upvr (readonly)
	]]
	-- KONSTANTERROR: [0] 1. Error Block 1 start (CF ANALYSIS FAILED)
	tbl_16_upvr.ADSMesh._aimToken = (tbl_16_upvr.ADSMesh._aimToken or 0) + 1
	local adsmeshhelper_result1, _ = adsmeshhelper_upvr()
	-- KONSTANTERROR: [0] 1. Error Block 1 end (CF ANALYSIS FAILED)
	-- KONSTANTERROR: [20] 15. Error Block 2 start (CF ANALYSIS FAILED)
	do
		return
	end
	-- KONSTANTERROR: [20] 15. Error Block 2 end (CF ANALYSIS FAILED)
	-- KONSTANTERROR: [21] 16. Error Block 3 start (CF ANALYSIS FAILED)
	-- KONSTANTERROR: [21] 16. Error Block 3 end (CF ANALYSIS FAILED)
end
local function ResetADSVisibilityToDefault_upvr() -- Line 1525, Named "ResetADSVisibilityToDefault"
	--[[ Upvalues[1]:
		[1]: tbl_16_upvr (readonly)
	]]
	-- KONSTANTERROR: [0] 1. Error Block 1 start (CF ANALYSIS FAILED)
	-- KONSTANTERROR: [0] 1. Error Block 1 end (CF ANALYSIS FAILED)
	-- KONSTANTERROR: [4] 4. Error Block 25 start (CF ANALYSIS FAILED)
	if not tbl_16_upvr.ADSMesh.ready then
		-- KONSTANTERROR: [10] 8. Error Block 3 start (CF ANALYSIS FAILED)
		do
			return
		end
		-- KONSTANTERROR: [10] 8. Error Block 3 end (CF ANALYSIS FAILED)
	end
	tbl_16_upvr.ADSMesh._lastOn = -1
	tbl_16_upvr.ADSMesh._lastGroup = -1
	tbl_16_upvr.ADSMesh._aimToken = (tbl_16_upvr.ADSMesh._aimToken or 0) + 1
	for _, v_16 in pairs(tbl_16_upvr.ADSMesh.groups) do
		for _, v_17 in ipairs(v_16.REG) do
			local part_3 = v_17.part
			if part_3 and part_3.Parent then
				local var531_upvr = tbl_16_upvr.Assets._activeTweens.ads[part_3]
				if var531_upvr then
					pcall(function() -- Line 1534
						--[[ Upvalues[1]:
							[1]: var531_upvr (readonly)
						]]
						var531_upvr:Cancel()
					end)
					tbl_16_upvr.Assets._activeTweens.ads[part_3] = nil
				end
				part_3.Transparency = v_17.default or 0
			end
		end
		for _, v_18 in ipairs(v_16.ADS) do
			local part = v_18.part
			if part then
				var531_upvr = part.Parent
				if var531_upvr then
					var531_upvr = tbl_16_upvr.Assets._activeTweens.ads[part]
					local var537_upvr = var531_upvr
					if var537_upvr then
						pcall(function() -- Line 1542
							--[[ Upvalues[1]:
								[1]: var537_upvr (readonly)
							]]
							var537_upvr:Cancel()
						end)
						tbl_16_upvr.Assets._activeTweens.ads[part] = nil
					end
					part.Transparency = v_18.default or 0
				end
			end
		end
	end
	-- KONSTANTERROR: [4] 4. Error Block 25 end (CF ANALYSIS FAILED)
end
local function SetAnimationSound_upvr(arg1, arg2) -- Line 1549, Named "SetAnimationSound"
	--[[ Upvalues[1]:
		[1]: tbl_16_upvr (readonly)
	]]
	local var540 = tbl_16_upvr.Assets.GunModel:FindFirstChild(arg1)
	if var540 then
		var540 = tbl_16_upvr.Assets.GunModel:FindFirstChild(arg1):FindFirstChild(arg2)
	end
	if var540 then
		var540.PlaybackSpeed = math.random(9, 11) / 10
		var540.TimePosition = 0
		var540:Play()
	end
end
local function _(arg1, arg2) -- Line 1561, Named "canAct"
	--[[ Upvalues[1]:
		[1]: tbl_16_upvr (readonly)
	]]
	local time_result1_6 = time()
	if time_result1_6 < (tbl_16_upvr._actionCooldowns[arg1] or 0) then
		return false
	end
	tbl_16_upvr._actionCooldowns[arg1] = time_result1_6 + (arg2 or 0)
	return true
end
local function cleanupViewmodel_upvr() -- Line 1569, Named "cleanupViewmodel"
	--[[ Upvalues[3]:
		[1]: tbl_16_upvr (readonly)
		[2]: tbl_6_upvr (readonly)
		[3]: ResetADSVisibilityToDefault_upvr (readonly)
	]]
	local ViewmodelBindName_upvr_2 = tbl_16_upvr.Settings.ViewmodelBindName
	pcall(function() -- Line 534
		--[[ Upvalues[2]:
			[1]: tbl_6_upvr (copied, readonly)
			[2]: ViewmodelBindName_upvr_2 (readonly)
		]]
		tbl_6_upvr.RunService:UnbindFromRenderStep(ViewmodelBindName_upvr_2)
	end)
	ViewmodelBindName_upvr_2 = tbl_16_upvr.States
	ViewmodelBindName_upvr_2.BlindFire = false
	ViewmodelBindName_upvr_2 = tbl_16_upvr.States
	ViewmodelBindName_upvr_2.BipodActive = false
	ViewmodelBindName_upvr_2 = tbl_16_upvr.States
	ViewmodelBindName_upvr_2.bipod = false
	ViewmodelBindName_upvr_2 = tbl_16_upvr.States
	ViewmodelBindName_upvr_2.LimitRot = Vector2.new(10, 25)
	ViewmodelBindName_upvr_2 = tbl_16_upvr.States
	ViewmodelBindName_upvr_2.LimitPos = Vector2.new(0.1, 0.05)
	ViewmodelBindName_upvr_2 = tbl_16_upvr.States
	ViewmodelBindName_upvr_2.sensitivity = 0.15
	ViewmodelBindName_upvr_2 = tbl_16_upvr
	ViewmodelBindName_upvr_2.isFiring = false
	ViewmodelBindName_upvr_2 = tbl_16_upvr
	local var544_upvr = ViewmodelBindName_upvr_2
	var544_upvr._activeFireLoopId += 1
	var544_upvr = tbl_16_upvr
	var544_upvr.Reloading = false
	var544_upvr = tbl_16_upvr
	var544_upvr.AmmoValue = nil
	var544_upvr = tbl_16_upvr
	var544_upvr.MaxAmmo = 0
	var544_upvr = tbl_16_upvr
	var544_upvr.RecoilProfile = nil
	var544_upvr = tbl_16_upvr
	var544_upvr.currentTool = nil
	var544_upvr = tbl_16_upvr
	var544_upvr.equipped = false
	var544_upvr = tbl_16_upvr
	var544_upvr.equipping = false
	var544_upvr = tbl_16_upvr
	var544_upvr.Aiming = false
	var544_upvr = tbl_16_upvr
	var544_upvr.AimMode = 1
	var544_upvr = tbl_16_upvr.States
	var544_upvr.GrenadeBusy = false
	var544_upvr = tbl_16_upvr
	var544_upvr.SettingsOfProf = nil
	var544_upvr = tbl_16_upvr.States
	var544_upvr.renderStartTime = nil
	var544_upvr = tbl_6_upvr.UserInputService
	var544_upvr.MouseIconEnabled = true
	var544_upvr = tbl_16_upvr.LocalPlayer
	var544_upvr.CameraMode = Enum.CameraMode.Classic
	var544_upvr = tbl_6_upvr.UserInputService
	var544_upvr.MouseDeltaSensitivity = tbl_16_upvr.Settings.NormalMouseSensitivity
	var544_upvr = tbl_6_upvr.UserInputService
	var544_upvr.MouseBehavior = Enum.MouseBehavior.Default
	var544_upvr = tbl_16_upvr.Camera
	if var544_upvr then
		var544_upvr = tbl_16_upvr.Camera
		local FieldOfView = workspace:GetAttribute("FieldOfView")
		if not FieldOfView then
			FieldOfView = tbl_16_upvr.Settings.DefaultFOV
		end
		var544_upvr.FieldOfView = FieldOfView
	end
	var544_upvr = tbl_16_upvr.Assets.Viewmodel
	local ADSMesh_upvr = tbl_16_upvr.ADSMesh
	if ADSMesh_upvr then
		ADSMesh_upvr = tbl_16_upvr.ADSMesh.ready
	end
	tbl_16_upvr.Assets.Viewmodel = nil
	tbl_16_upvr.AnimationsTable = {}
	tbl_16_upvr.ActiveBreathSound = nil
	tbl_16_upvr.Assets._flashlightToggles = nil
	tbl_16_upvr._actionCooldowns = {}
	table.clear(tbl_16_upvr.muzzleEmitters)
	table.clear(tbl_16_upvr.muzzleLights)
	tbl_16_upvr.muzzle = nil
	tbl_16_upvr.bolt = nil
	tbl_16_upvr.motor = nil
	tbl_16_upvr.drySound = nil
	local fov_upvr = tbl_16_upvr.Assets._activeTweens.fov
	if fov_upvr then
		pcall(function() -- Line 530
			--[[ Upvalues[1]:
				[1]: fov_upvr (readonly)
			]]
			fov_upvr:Cancel()
		end)
	end
	fov_upvr = tbl_16_upvr.Assets._activeTweens.dof
	local var549_upvr = fov_upvr
	if var549_upvr then
		pcall(function() -- Line 530
			--[[ Upvalues[1]:
				[1]: var549_upvr (readonly)
			]]
			var549_upvr:Cancel()
		end)
	end
	var549_upvr = tbl_16_upvr.Assets._activeTweens.boltPull
	local var551_upvr = var549_upvr
	if var551_upvr then
		pcall(function() -- Line 530
			--[[ Upvalues[1]:
				[1]: var551_upvr (readonly)
			]]
			var551_upvr:Cancel()
		end)
	end
	var551_upvr = tbl_16_upvr.Assets._activeTweens.boltReset
	local var553_upvr = var551_upvr
	if var553_upvr then
		pcall(function() -- Line 530
			--[[ Upvalues[1]:
				[1]: var553_upvr (readonly)
			]]
			var553_upvr:Cancel()
		end)
	end
	var553_upvr = tbl_16_upvr.Assets._activeTweens.ads
	tbl_16_upvr.Assets._activeTweens.ads = {}
	if tbl_16_upvr.Assets.SuppressionBlur then
		tbl_16_upvr.Assets.SuppressionBlur.Size = 0
	end
	local ActiveBreathSound_upvr = tbl_16_upvr.ActiveBreathSound
	local AnimationsTable_upvr = tbl_16_upvr.AnimationsTable
	task.spawn(function() -- Line 1629
		--[[ Upvalues[7]:
			[1]: var553_upvr (readonly)
			[2]: ADSMesh_upvr (readonly)
			[3]: ResetADSVisibilityToDefault_upvr (copied, readonly)
			[4]: tbl_16_upvr (copied, readonly)
			[5]: ActiveBreathSound_upvr (readonly)
			[6]: AnimationsTable_upvr (readonly)
			[7]: var544_upvr (readonly)
		]]
		for _, v_19_upvr in pairs(var553_upvr) do
			if v_19_upvr then
				pcall(function() -- Line 530
					--[[ Upvalues[1]:
						[1]: v_19_upvr (readonly)
					]]
					v_19_upvr:Cancel()
				end)
			end
		end
		if ADSMesh_upvr then
			pcall(ResetADSVisibilityToDefault_upvr)
		end
		if tbl_16_upvr.ADSMesh then
			tbl_16_upvr.ADSMesh.ready = false
		end
		pcall(function() -- Line 1641
			--[[ Upvalues[1]:
				[1]: tbl_16_upvr (copied, readonly)
			]]
			tbl_16_upvr.Modules.MovementModule.SprintState(true)
		end)
		pcall(function() -- Line 1642
			--[[ Upvalues[1]:
				[1]: tbl_16_upvr (copied, readonly)
			]]
			tbl_16_upvr.Modules.LaserHandler.Cleanup()
		end)
		pcall(function() -- Line 1643
			--[[ Upvalues[1]:
				[1]: tbl_16_upvr (copied, readonly)
			]]
			tbl_16_upvr.Modules.SightModule:Cleanup()
		end)
		tbl_16_upvr.Modules.Utilities:VisibleFocus(false, tbl_16_upvr.GunHud)
		if ActiveBreathSound_upvr then
			pcall(function() -- Line 1647
				--[[ Upvalues[1]:
					[1]: ActiveBreathSound_upvr (copied, readonly)
				]]
				ActiveBreathSound_upvr.Volume = 0
				ActiveBreathSound_upvr:Stop()
				ActiveBreathSound_upvr:Destroy()
			end)
		end
		for _, v_20_upvr in ipairs(AnimationsTable_upvr) do
			pcall(function() -- Line 1655
				--[[ Upvalues[1]:
					[1]: v_20_upvr (readonly)
				]]
				v_20_upvr:Destroy()
			end)
		end
		if var544_upvr then
			pcall(function() -- Line 1659
				--[[ Upvalues[1]:
					[1]: var544_upvr (copied, readonly)
				]]
				var544_upvr:Destroy()
			end)
		end
		tbl_16_upvr.ViewmodelJanitor:Cleanup()
	end)
end
local function LoadToolState_upvr(arg1) -- Line 1667, Named "LoadToolState"
	--[[ Upvalues[2]:
		[1]: tbl_16_upvr (readonly)
		[2]: SetSuppressorVisibility_upvr (readonly)
	]]
	if not arg1 then
	else
		local MagInserted_5 = arg1:GetAttribute("MagInserted")
		local RocketInserted_2 = arg1:GetAttribute("RocketInserted")
		local WeaponModules_4 = arg1:FindFirstChild("WeaponModules")
		if WeaponModules_4 then
			WeaponModules_4 = arg1.WeaponModules:FindFirstChild("Variables")
		end
		if WeaponModules_4 then
			if MagInserted_5 ~= nil then
				local MagInserted_3 = WeaponModules_4:FindFirstChild("MagInserted")
				if MagInserted_3 then
					MagInserted_3.Value = MagInserted_5
				end
			end
			if RocketInserted_2 ~= nil then
				local RocketInserted_7 = WeaponModules_4:FindFirstChild("RocketInserted")
				if RocketInserted_7 then
					RocketInserted_7.Value = RocketInserted_2
				end
			end
		end
		local Jammed_2 = arg1:GetAttribute("Jammed")
		if Jammed_2 ~= nil then
			if tbl_16_upvr.JammedValue then
				tbl_16_upvr.JammedValue.Value = Jammed_2
			end
		end
		local ChamberedAttr_4 = arg1:GetAttribute("ChamberedAttr")
		if ChamberedAttr_4 ~= nil and tbl_16_upvr.ChamberedValue then
			local var627 = tbl_16_upvr
			if ChamberedAttr_4 then
				var627 = true
			else
				var627 = false
			end
			var627.ChamberedValue.Value = var627
		end
		local FireModeIndex_3 = arg1:GetAttribute("FireModeIndex")
		local var629
		if FireModeIndex_3 and typeof(FireModeIndex_3) == "number" then
			var629 = tbl_16_upvr
			if var629.FireModeList[FireModeIndex_3] then
				tbl_16_upvr.FireModeIndex = FireModeIndex_3
				var629 = tbl_16_upvr.FireModeList
				tbl_16_upvr.FireMode = var629[tbl_16_upvr.FireModeIndex]
			end
		end
		var629 = "AimMode"
		local attribute_3 = arg1:GetAttribute(var629)
		if attribute_3 then
			var629 = attribute_3
			if typeof(var629) == "number" then
				tbl_16_upvr.AimMode = attribute_3
			end
		end
		local SuppressorEnabled_3 = arg1:GetAttribute("SuppressorEnabled")
		var629 = arg1:FindFirstChild("WeaponModules")
		if var629 then
			var629 = arg1.WeaponModules:FindFirstChild("Variables")
			if var629 then
				var629 = arg1.WeaponModules.Variables:FindFirstChild("Suppressor")
				local var632
			end
		end
		if SuppressorEnabled_3 ~= nil and var629 then
			var629.Value = SuppressorEnabled_3
			var632 = SuppressorEnabled_3
			SetSuppressorVisibility_upvr(var632)
		end
		local LaserEnabled_upvr_4 = arg1:GetAttribute("LaserEnabled")
		var632 = arg1:FindFirstChild("WeaponModules")
		if var632 then
			var632 = arg1.WeaponModules:FindFirstChild("Variables")
			if var632 then
				var632 = arg1.WeaponModules.Variables:FindFirstChild("Laser")
			end
		end
		if LaserEnabled_upvr_4 ~= nil and var632 then
			var632.Value = LaserEnabled_upvr_4
			pcall(function() -- Line 1722
				--[[ Upvalues[2]:
					[1]: tbl_16_upvr (copied, readonly)
					[2]: LaserEnabled_upvr_4 (readonly)
				]]
				tbl_16_upvr.Modules.LaserHandler.SetLaserEnabled(LaserEnabled_upvr_4)
			end)
		end
	end
end
local function updateMagHUD_upvr() -- Line 1728, Named "updateMagHUD"
	--[[ Upvalues[2]:
		[1]: tbl_16_upvr (readonly)
		[2]: tbl_6_upvr (readonly)
	]]
	-- KONSTANTWARNING: Variable analysis failed. Output will have some incorrect variable assignments
	-- KONSTANTERROR: [0] 1. Error Block 34 start (CF ANALYSIS FAILED)
	local Frame_2 = tbl_16_upvr.GunHudFrame:FindFirstChild("Frame")
	if not Frame_2 then return end
	if not tbl_16_upvr.Modules.MagazineController.GetCurrentMagCount(tbl_16_upvr.currentTool) then return end
	if not tbl_16_upvr._magSlots then
		tbl_16_upvr._magSlots = {}
		local Mag = Frame_2:FindFirstChild("Mag")
		if not Mag then return end
		for i_23 = 1, tbl_16_upvr.Settings.MaxMagIcons or 10 do
			local clone_4 = Mag:Clone()
			clone_4.Name = "MagSlot"..i_23
			clone_4.Visible = false
			clone_4.Parent = Frame_2
			tbl_16_upvr._magSlots[i_23] = clone_4
			local _
		end
	end
	local var644 = tbl_16_upvr
	local ipairs_result1, ipairs_result2_10, ipairs_result3_3 = ipairs(var644._magSlots)
	-- KONSTANTERROR: [0] 1. Error Block 34 end (CF ANALYSIS FAILED)
	-- KONSTANTERROR: [139] 102. Error Block 21 start (CF ANALYSIS FAILED)
	-- KONSTANTERROR: [139] 102. Error Block 21 end (CF ANALYSIS FAILED)
	-- KONSTANTERROR: [86] 63. Error Block 38 start (CF ANALYSIS FAILED)
	-- KONSTANTERROR: Expression was reused, decompilation is incorrect
	if tbl_16_upvr._magSlots then
		local function INLINED_24() -- Internal function, doesn't exist in bytecode
			-- KONSTANTWARNING: Failed to evaluate expression, replaced with nil [139.2147483650]
			-- KONSTANTERROR: Expression was reused, decompilation is incorrect
			return i_23 < tbl_16_upvr
		end
		if var644 == 1 or INLINED_24() then
			-- KONSTANTERROR: Expression was reused, decompilation is incorrect
			if tbl_16_upvr then
			end
			-- KONSTANTWARNING: GOTO [139] #102
		end
	end
	-- KONSTANTERROR: [86] 63. Error Block 38 end (CF ANALYSIS FAILED)
end
tbl_16_upvr.AmmoRefill = {}
tbl_16_upvr.AmmoRefill.IsRocketLauncher = function() -- Line 1769, Named "IsRocketLauncher"
	--[[ Upvalues[1]:
		[1]: tbl_16_upvr (readonly)
	]]
	-- KONSTANTERROR: [0] 1. Error Block 1 start (CF ANALYSIS FAILED)
	-- KONSTANTERROR: [0] 1. Error Block 1 end (CF ANALYSIS FAILED)
	-- KONSTANTERROR: [4] 4. Error Block 21 start (CF ANALYSIS FAILED)
	if not tbl_16_upvr.Assets.SettingsGun then
		-- KONSTANTERROR: [10] 8. Error Block 17 start (CF ANALYSIS FAILED)
		do
			return false
		end
		-- KONSTANTERROR: [10] 8. Error Block 17 end (CF ANALYSIS FAILED)
	end
	if tbl_16_upvr.Assets.SettingsGun.Rocket == true then
		return true
	end
	local any_GetEquippedTool_result1_2 = tbl_16_upvr.AmmoRefill.GetEquippedTool()
	local function INLINED_25() -- Internal function, doesn't exist in bytecode
		local any_lower_result1 = any_GetEquippedTool_result1_2.Name:lower()
		return any_lower_result1:find("rpg-7")
	end
	if any_GetEquippedTool_result1_2 and (INLINED_25() or any_lower_result1:find("at4") or any_lower_result1:find("rpg-26") or any_lower_result1:find("launcher") or any_lower_result1:find("rocket")) then
		return true
	end
	do
		return false
	end
	-- KONSTANTERROR: [4] 4. Error Block 21 end (CF ANALYSIS FAILED)
end
tbl_16_upvr.AmmoRefill.GetEquippedTool = function() -- Line 1787, Named "GetEquippedTool"
	--[[ Upvalues[1]:
		[1]: tbl_16_upvr (readonly)
	]]
	local Character_2 = tbl_16_upvr.LocalPlayer.Character
	if not Character_2 then
		return nil
	end
	for _, v_21 in ipairs(Character_2:GetChildren()) do
		if v_21:IsA("Tool") then
			if v_21:FindFirstChild("WeaponModules") then
				if tbl_16_upvr.Modules.MagazineController.GetState(v_21) then
					return v_21
				end
			end
		end
	end
	return nil
end
tbl_16_upvr.AmmoRefill.ComputeNeededSpareOnly = function() -- Line 1800, Named "ComputeNeededSpareOnly"
	--[[ Upvalues[1]:
		[1]: tbl_16_upvr (readonly)
	]]
	-- KONSTANTWARNING: Variable analysis failed. Output will have some incorrect variable assignments
	local var664
	if tbl_16_upvr.AmmoRefill.IsRocketLauncher() then
		return 0
	end
	local any_GetEquippedTool_result1 = tbl_16_upvr.AmmoRefill.GetEquippedTool()
	if not any_GetEquippedTool_result1 then
		return 0
	end
	var664 = tbl_16_upvr.Modules
	local any_GetState_result1 = var664.MagazineController.GetState(any_GetEquippedTool_result1)
	if not any_GetState_result1 then
		return 0
	end
	var664 = any_GetState_result1.magSize
	var664 = 0
	local spareMags = any_GetState_result1.spareMags
	if not spareMags then
		spareMags = {}
	end
	local ipairs_result1_3, ipairs_result2_21, ipairs_result3_17 = ipairs(spareMags)
	for _, v_22 in ipairs_result1_3, ipairs_result2_21, ipairs_result3_17 do
		var664 += math.max(0, (var664 or 1) - v_22)
		local var671
	end
	if var664 == 0 then
		ipairs_result2_21 = any_GetState_result1.spareMags
		local var672 = ipairs_result2_21
		if not var672 then
			var672 = {}
		end
		if #var672 == 0 then
			var664 = var671
		end
	end
	return var664
end
tbl_16_upvr.AmmoRefill.ApplyGrantedToEquipped = function(arg1) -- Line 1824, Named "ApplyGrantedToEquipped"
	--[[ Upvalues[2]:
		[1]: tbl_16_upvr (readonly)
		[2]: updateMagHUD_upvr (readonly)
	]]
	local var675
	if (arg1 or 0) <= 0 then
	else
		if tbl_16_upvr.AmmoRefill.IsRocketLauncher() then return end
		local any_GetEquippedTool_result1_3 = tbl_16_upvr.AmmoRefill.GetEquippedTool()
		if not any_GetEquippedTool_result1_3 then return end
		local any_GetState_result1_2 = tbl_16_upvr.Modules.MagazineController.GetState(any_GetEquippedTool_result1_3)
		if not any_GetState_result1_2 then return end
		local magSize = any_GetState_result1_2.magSize
		local function _(arg1_2, arg2, arg3) -- Line 1836, Named "clamp"
			return math.max(arg2, math.min(arg3, arg1_2))
		end
		for i_43 = 1, #any_GetState_result1_2.spareMags do
			if var675 <= 0 then break end
			local var679 = any_GetState_result1_2.spareMags[i_43]
			local maximum_2 = math.max(0, magSize - var679)
			if 0 < maximum_2 then
				local minimum = math.min(maximum_2, var675)
				any_GetState_result1_2.spareMags[i_43] = math.max(0, math.min(magSize, var679 + minimum))
				var675 -= minimum
			end
		end
		while magSize <= var675 do
			i_43 = magSize
			table.insert(any_GetState_result1_2.spareMags, i_43)
			var675 -= magSize
		end
		if 0 < var675 then
			i_43 = math.max(0, math.min(magSize, var675))
			table.insert(any_GetState_result1_2.spareMags, i_43)
			var675 = 0
		end
		table.sort(any_GetState_result1_2.spareMags, function(arg1_3, arg2) -- Line 1855
			if arg2 >= arg1_3 then
			else
			end
			return true
		end)
		if any_GetState_result1_2.AmmoValue then
			any_GetState_result1_2.AmmoValue.Value = any_GetState_result1_2.currentMag or 0
		end
		local var683 = any_GetEquippedTool_result1_3
		if any_GetState_result1_2.currentMag == 0 then
			var683 = 1
		else
			var683 = 0
		end
		if any_GetState_result1_2.MagsValue then
			any_GetState_result1_2.MagsValue.Value = (1) + ((#any_GetState_result1_2.spareMags) - (tbl_16_upvr.Modules.MagazineController.GetEmptyMagsCount(var683) - var683))
		end
		tbl_16_upvr.Modules.MagazineController.SaveState(any_GetEquippedTool_result1_3)
		pcall(updateMagHUD_upvr)
	end
end
local function Unequip_upvr(arg1) -- Line 1866, Named "Unequip"
	--[[ Upvalues[4]:
		[1]: tbl_16_upvr (readonly)
		[2]: cleanupViewmodel_upvr (readonly)
		[3]: UnbindAllActions_upvr (readonly)
		[4]: tbl_6_upvr (readonly)
	]]
	local var736 = tbl_16_upvr
	var736._equipToken += 1
	tbl_16_upvr.Assets._lastUnequipAt = time()
	tbl_16_upvr.States.isHoldingFocus = false
	tbl_16_upvr.Modules.MovementModule.SprintState(true)
	tbl_16_upvr.Modules.MovementModule.UpdateSpeed()
	tbl_16_upvr.States.BlindFire = false
	tbl_16_upvr.States.BipodActive = false
	tbl_16_upvr.States.bipod = false
	tbl_16_upvr.Aiming = false
	tbl_16_upvr.States.isHoldingFocus = false
	tbl_16_upvr.States.StanceViewmodel = 0
	local currentTool_3_upvr = tbl_16_upvr.currentTool
	local ServerIdle_upvr = tbl_16_upvr.AnimationsTable.ServerIdle
	local var739
	if ServerIdle_upvr then
		var739 = pcall
		var739(function() -- Line 1886
			--[[ Upvalues[1]:
				[1]: ServerIdle_upvr (readonly)
			]]
			ServerIdle_upvr:Stop(0)
		end)
	end
	var739 = pairs(tbl_16_upvr.KeybindUIs)
	local pairs_result1_21, pairs_result2_26, pairs_result3 = pairs(tbl_16_upvr.KeybindUIs)
	for i_26, v_23 in pairs_result1_21, pairs_result2_26, pairs_result3 do
		v_23.Visible = false
	end
	pairs_result1_21 = tbl_16_upvr.Character
	if pairs_result1_21 then
		pairs_result1_21 = tbl_16_upvr.Character
		i_26 = true
		pairs_result1_21 = pairs_result1_21:SetAttribute
		pairs_result1_21("VisibleArms", i_26)
	end
	pairs_result1_21 = tbl_16_upvr.Modules.MovementModule.SetWeight
	pairs_result1_21(0)
	pairs_result1_21 = tbl_16_upvr.JammedValue
	if pairs_result1_21 then
		pairs_result1_21 = tbl_16_upvr.JammedValue
		pairs_result1_21.Value = false
	end
	if currentTool_3_upvr then
		pairs_result1_21 = tbl_16_upvr.ChamberedValue
		if pairs_result1_21 then
			pairs_result1_21 = currentTool_3_upvr:SetAttribute
			pairs_result1_21("ChamberedAttr", tbl_16_upvr.ChamberedValue.Value)
		end
	end
	pairs_result1_21 = currentTool_3_upvr
	if pairs_result1_21 then
		pairs_result1_21 = currentTool_3_upvr:FindFirstChild("WeaponModules")
		if pairs_result1_21 then
			pairs_result1_21 = currentTool_3_upvr.WeaponModules:FindFirstChild("Variables")
		end
	end
	if pairs_result1_21 then
		local Suppressor_2 = pairs_result1_21:FindFirstChild("Suppressor")
		if Suppressor_2 then
			currentTool_3_upvr:SetAttribute("SuppressorEnabled", Suppressor_2.Value)
		end
		local MagInserted_7 = pairs_result1_21:FindFirstChild("MagInserted")
		if MagInserted_7 then
			currentTool_3_upvr:SetAttribute("MagInserted", MagInserted_7.Value)
		end
		local RocketInserted_4 = pairs_result1_21:FindFirstChild("RocketInserted")
		if RocketInserted_4 then
			currentTool_3_upvr:SetAttribute("RocketInserted", RocketInserted_4.Value)
		end
	end
	if tbl_16_upvr._equipToken ~= tbl_16_upvr._equipToken then
	else
		cleanupViewmodel_upvr()
		UnbindAllActions_upvr()
		tbl_16_upvr.States.GunTilting = false
		local SettingsGun_upvr = tbl_16_upvr.Assets.SettingsGun
		task.spawn(function() -- Line 1933
			--[[ Upvalues[3]:
				[1]: tbl_16_upvr (copied, readonly)
				[2]: currentTool_3_upvr (readonly)
				[3]: SettingsGun_upvr (readonly)
			]]
			-- KONSTANTWARNING: Variable analysis failed. Output will have some incorrect variable assignments
			pcall(function() -- Line 1934
				--[[ Upvalues[1]:
					[1]: tbl_16_upvr (copied, readonly)
				]]
				require(tbl_16_upvr.Framework.Modules.ScopeOptic).SetEnabled(false)
			end)
			local var758
			local function INLINED_27() -- Internal function, doesn't exist in bytecode
				var758 = currentTool_3_upvr
				return var758
			end
			if var758 or INLINED_27() then
				var758 = SettingsGun_upvr
				if var758 then
					var758 = SettingsGun_upvr.Mode
					if var758 == "Bino" then
						var758 = tbl_16_upvr.States
						var758.AimHide = false
						var758 = tbl_16_upvr.Modules.Utilities:VisibleBino
						var758(false, tbl_16_upvr.GunHud)
					end
				end
				var758 = pcall
				var758(function() -- Line 1944
					--[[ Upvalues[2]:
						[1]: tbl_16_upvr (copied, readonly)
						[2]: currentTool_3_upvr (copied, readonly)
					]]
					tbl_16_upvr.Bridges.WeaponAction:Fire({
						action = "Unequip";
						tool = currentTool_3_upvr;
					})
				end)
				var758 = tbl_16_upvr.Modules.MagazineController.SaveState
				var758(currentTool_3_upvr)
				var758 = currentTool_3_upvr
				if var758 then
					var758 = currentTool_3_upvr:FindFirstChild("WeaponModules")
					if var758 then
						var758 = currentTool_3_upvr.WeaponModules:FindFirstChild("Variables")
						if var758 then
							var758 = currentTool_3_upvr.WeaponModules.Variables:FindFirstChild("Holster")
							local var761 = var758
						end
					end
				end
				if var761 and var761.Value == true and SettingsGun_upvr then
					tbl_16_upvr.Bridges.HolsterBridge:Fire({
						Tool = currentTool_3_upvr;
						Character = tbl_16_upvr.Character;
						Type = "Create";
						Part = SettingsGun_upvr.HolsterPart;
						HolsterCF = SettingsGun_upvr.HolsterCF;
						MoveAxis = SettingsGun_upvr.MoveAxis;
					})
				end
			end
			var761 = tbl_16_upvr.GunHudFrame:FindFirstChild("Frame")
			local var763 = var761
			if var763 then
				for _, v_39 in pairs(var763:GetChildren()) do
					if v_39:IsA("Frame") and v_39.Name ~= "Mag" then
						v_39:Destroy()
					end
				end
				tbl_16_upvr._magSlots = nil
			end
			tbl_16_upvr.Modules.MovementModule.UpdateSpeed()
		end)
		tbl_16_upvr.LocalUtilities.BackPackSwitch(not arg1, tbl_6_upvr)
	end
end
local function _() -- Line 1983, Named "IsBusy"
	--[[ Upvalues[1]:
		[1]: tbl_16_upvr (readonly)
	]]
	-- KONSTANTERROR: [0] 1. Error Block 1 start (CF ANALYSIS FAILED)
	local var769
	-- KONSTANTERROR: [0] 1. Error Block 1 end (CF ANALYSIS FAILED)
	-- KONSTANTERROR: [4] 4. Error Block 22 start (CF ANALYSIS FAILED)
	var769 = tbl_16_upvr.humanoid.PlatformStand
	if not var769 then
		-- KONSTANTERROR: [10] 8. Error Block 3 start (CF ANALYSIS FAILED)
		var769 = false
		-- KONSTANTERROR: [10] 8. Error Block 3 end (CF ANALYSIS FAILED)
	end
	local equipping_3 = tbl_16_upvr.equipping
	if not equipping_3 then
		equipping_3 = tbl_16_upvr.Reloading
		if not equipping_3 then
			equipping_3 = tbl_16_upvr.States.suppressorBusy
			if not equipping_3 then
				equipping_3 = tbl_16_upvr.States.GrenadeBusy
				if not equipping_3 then
					equipping_3 = true
					if tbl_16_upvr.States.StanceViewmodel == 0 then
						equipping_3 = tbl_16_upvr.States.boltBusy
						if not equipping_3 then
							equipping_3 = tbl_16_upvr.States.Climbing
							if not equipping_3 then
								equipping_3 = var769
							end
						end
					end
				end
			end
		end
	end
	do
		return equipping_3
	end
	-- KONSTANTERROR: [4] 4. Error Block 22 end (CF ANALYSIS FAILED)
end
local function UpdateKeybindVisibility_upvr() -- Line 1988, Named "UpdateKeybindVisibility"
	--[[ Upvalues[1]:
		[1]: tbl_16_upvr (readonly)
	]]
	-- KONSTANTERROR: [0] 1. Error Block 1 start (CF ANALYSIS FAILED)
	-- KONSTANTERROR: [0] 1. Error Block 1 end (CF ANALYSIS FAILED)
	-- KONSTANTERROR: [4] 4. Error Block 2 start (CF ANALYSIS FAILED)
	-- KONSTANTERROR: [4] 4. Error Block 2 end (CF ANALYSIS FAILED)
	-- KONSTANTERROR: [10] 8. Error Block 105 start (CF ANALYSIS FAILED)
	for _, v_24 in pairs(tbl_16_upvr.KeybindUIs) do
		v_24.Visible = false
	end
	do
		return
	end
	-- KONSTANTERROR: [10] 8. Error Block 105 end (CF ANALYSIS FAILED)
end
local var776_upvw = false
local var777_upvw = 0
local function _() -- Line 2032, Named "UpdateKeybindVisibilityThrottled"
	--[[ Upvalues[3]:
		[1]: var777_upvw (read and write)
		[2]: var776_upvw (read and write)
		[3]: UpdateKeybindVisibility_upvr (readonly)
	]]
	local time_result1_7 = time()
	if time_result1_7 - var777_upvw < 0.2 then
	else
		var777_upvw = time_result1_7
		var776_upvw = true
		task.defer(function() -- Line 2037
			--[[ Upvalues[2]:
				[1]: var776_upvw (copied, read and write)
				[2]: UpdateKeybindVisibility_upvr (copied, readonly)
			]]
			var776_upvw = false
			UpdateKeybindVisibility_upvr()
		end)
	end
end
local var780_upvw
local function Equip_upvr(arg1) -- Line 2045, Named "Equip"
	--[[ Upvalues[21]:
		[1]: tbl_6_upvr (readonly)
		[2]: tbl_16_upvr (readonly)
		[3]: UnbindAllActions_upvr (readonly)
		[4]: cleanupViewmodel_upvr (readonly)
		[5]: var780_upvw (read and write)
		[6]: notifyZoneChange_upvr (readonly)
		[7]: applyHeatCosmetics_upvr (readonly)
		[8]: var777_upvw (read and write)
		[9]: var776_upvw (read and write)
		[10]: UpdateKeybindVisibility_upvr (readonly)
		[11]: CacheADSParts_upvr (readonly)
		[12]: SetAnimationSound_upvr (readonly)
		[13]: DoAdsMesh_upvr (readonly)
		[14]: SetProjectorSightVisible_upvr (readonly)
		[15]: RefreshInsertVisuals_upvr (readonly)
		[16]: SetSuppressorVisibility_upvr (readonly)
		[17]: LoadToolState_upvr (readonly)
		[18]: CacheMuzzleFX_upvr (readonly)
		[19]: CacheChamberFX_upvr (readonly)
		[20]: any_new_result1_upvr (readonly)
		[21]: updateMagHUD_upvr (readonly)
	]]
	-- KONSTANTERROR: [0] 1. Error Block 361 start (CF ANALYSIS FAILED)
	local function _equipFail(arg1_4) -- Line 2046
		--[[ Upvalues[4]:
			[1]: tbl_6_upvr (copied, readonly)
			[2]: tbl_16_upvr (copied, readonly)
			[3]: UnbindAllActions_upvr (copied, readonly)
			[4]: cleanupViewmodel_upvr (copied, readonly)
		]]
		if arg1_4 then
			warn("[Equip] "..tostring(arg1_4))
		end
		pcall(function() -- Line 2048
			--[[ Upvalues[2]:
				[1]: tbl_6_upvr (copied, readonly)
				[2]: tbl_16_upvr (copied, readonly)
			]]
			tbl_6_upvr.RunService:UnbindFromRenderStep(tbl_16_upvr.Settings.ViewmodelBindName)
		end)
		UnbindAllActions_upvr()
		cleanupViewmodel_upvr()
		tbl_16_upvr.equipping = false
		tbl_16_upvr.LocalUtilities.BackPackSwitch(true, tbl_6_upvr)
		return false
	end
	if not arg1 or not arg1:IsA("Tool") then return end
	-- KONSTANTERROR: [0] 1. Error Block 361 end (CF ANALYSIS FAILED)
	-- KONSTANTERROR: [16] 15. Error Block 464 start (CF ANALYSIS FAILED)
	if tbl_16_upvr.humanoid.Health <= 0 then
		-- KONSTANTERROR: [24] 20. Error Block 7 start (CF ANALYSIS FAILED)
		do
			return
		end
		-- KONSTANTERROR: [24] 20. Error Block 7 end (CF ANALYSIS FAILED)
	end
	if tbl_16_upvr.equipped and tbl_16_upvr.currentTool == arg1 then return end
	if tbl_16_upvr.equipping then return end
	if tbl_16_upvr.Character:GetAttribute("NeedsRevive") then return end
	tbl_16_upvr.equipping = true
	local var782 = tbl_16_upvr
	var782._equipToken += 1
	tbl_16_upvr.LocalUtilities.BackPackSwitch(false, tbl_6_upvr)
	tbl_16_upvr.InputBindings = require(tbl_16_upvr.Framework:WaitForChild("KeyBinds")).InputBindings
	tbl_16_upvr.InputBindingsAlways = require(tbl_16_upvr.Framework:WaitForChild("KeyBinds")).InputBindingsAlways
	if not tbl_16_upvr.Character.Humanoid:FindFirstChildOfClass("Animator") then
	end
	tbl_6_upvr.RunService:UnbindFromRenderStep(tbl_16_upvr.Settings.ViewmodelBindName)
	local var783 = tbl_16_upvr
	var783.currentTool = arg1
	if not arg1 then
		var783 = nil
	else
		local var784 = tbl_16_upvr.PerToolState[arg1]
		if not var784 then
			var784 = {
				nextShotTime = 0;
				lastShotAt = 0;
				rapidStreak = 0;
				Overheated = false;
				Heat = 0;
			}
			tbl_16_upvr.PerToolState[arg1] = var784
		end
		var783 = var784
	end
	pcall(function() -- Line 2082
		--[[ Upvalues[1]:
			[1]: tbl_16_upvr (copied, readonly)
		]]
		tbl_16_upvr.Bridges.WeaponAction:Fire({
			action = "Equip";
			tool = tbl_16_upvr.currentTool;
		})
	end)
	var783.Heat = math.min(var783.Heat or 0, tbl_16_upvr.MaxHeat * 0.25)
	var783.Overheated = false
	local pcall_result1_3, pcall_result2_6 = pcall(function() -- Line 2088
		--[[ Upvalues[2]:
			[1]: tbl_16_upvr (copied, readonly)
			[2]: arg1 (readonly)
		]]
		tbl_16_upvr.Assets.Viewmodel = tbl_16_upvr.Modules.ViewmodelSetup:Setup(arg1)
	end)
	if not pcall_result1_3 or not tbl_16_upvr.Assets.Viewmodel then
		return _equipFail("Failed to create Viewmodel: "..tostring(pcall_result2_6))
	end
	tbl_16_upvr.Bridges.HolsterBridge:Fire({
		Tool = tbl_16_upvr.currentTool;
		Character = tbl_16_upvr.Character;
		Type = "Remove";
	})
	tbl_6_upvr.UserInputService.MouseIconEnabled = false
	tbl_16_upvr.LocalPlayer.CameraMode = Enum.CameraMode.LockFirstPerson
	tbl_16_upvr.ViewmodelJanitor:Add(function() -- Line 2100
		--[[ Upvalues[2]:
			[1]: tbl_6_upvr (copied, readonly)
			[2]: tbl_16_upvr (copied, readonly)
		]]
		tbl_6_upvr.RunService:UnbindFromRenderStep(tbl_16_upvr.Settings.ViewmodelBindName)
	end, true)
	local _equipToken_upvr_3 = tbl_16_upvr._equipToken
	tbl_6_upvr.RunService:BindToRenderStep(tbl_16_upvr.Settings.ViewmodelBindName, tbl_16_upvr.Settings.RenderStepPriority, function(arg1_5) -- Line 2104
		--[[ Upvalues[9]:
			[1]: _equipToken_upvr_3 (readonly)
			[2]: tbl_16_upvr (copied, readonly)
			[3]: tbl_6_upvr (copied, readonly)
			[4]: var780_upvw (copied, read and write)
			[5]: notifyZoneChange_upvr (copied, readonly)
			[6]: applyHeatCosmetics_upvr (copied, readonly)
			[7]: var777_upvw (copied, read and write)
			[8]: var776_upvw (copied, read and write)
			[9]: UpdateKeybindVisibility_upvr (copied, readonly)
		]]
		-- KONSTANTERROR: [0] 1. Error Block 1 start (CF ANALYSIS FAILED)
		-- KONSTANTERROR: [0] 1. Error Block 1 end (CF ANALYSIS FAILED)
		-- KONSTANTERROR: [6] 5. Error Block 2 start (CF ANALYSIS FAILED)
		do
			return
		end
		-- KONSTANTERROR: [6] 5. Error Block 2 end (CF ANALYSIS FAILED)
		-- KONSTANTERROR: [7] 6. Error Block 3 start (CF ANALYSIS FAILED)
		tbl_16_upvr.Modules.ViewmodelController.Render(arg1_5, tbl_16_upvr.Modules, tbl_16_upvr.Assets, tbl_16_upvr.States, {
			humanoid = tbl_16_upvr.humanoid;
			hrp = tbl_16_upvr.hrp;
			head = tbl_16_upvr.Head;
			torso = tbl_16_upvr.Torso;
			neck = tbl_16_upvr.Neck;
			waist = tbl_16_upvr.Waist;
			neckOrigin = tbl_16_upvr.NeckOrigin;
			waistOrigin = tbl_16_upvr.WaistOrigin;
		}, tbl_16_upvr.BobbleModule, tbl_16_upvr.RecoilModule, tbl_16_upvr.Aiming, tbl_16_upvr.AimMode, tbl_16_upvr.Modules.Utilities, tbl_16_upvr.Camera, tbl_16_upvr.StateValues, tbl_16_upvr.Springs, tbl_6_upvr.UserInputService, tbl_16_upvr.GunHud, tbl_16_upvr.Bridges, tbl_16_upvr.currentTool)
		-- KONSTANTERROR: [7] 6. Error Block 3 end (CF ANALYSIS FAILED)
	end)
	local SOME_5 = tbl_16_upvr.Client:FindFirstChild(arg1.Name)
	if not SOME_5 then
		return _equipFail("No client gun model named "..arg1.Name.." in Models.Client")
	end
	tbl_16_upvr.Assets.GunModel = SOME_5:Clone()
	tbl_16_upvr.Assets.GunModel.Parent = tbl_16_upvr.Assets.Viewmodel
	tbl_16_upvr.Assets._flashlightToggles = nil
	tbl_16_upvr.Modules.LaserHandler.Init(tbl_16_upvr.Assets.GunModel)
	local Assets = tbl_16_upvr.Assets
	CacheADSParts_upvr(Assets.GunModel)
	if tbl_16_upvr.Assets.GunModel:FindFirstChild("Suppressor") == nil then
		Assets = false
	else
		Assets = true
	end
	;({}).hasSuppressor = Assets
	local GunModel = tbl_16_upvr.Assets.GunModel
	if not GunModel or not GunModel:IsA("Model") then
		-- KONSTANTWARNING: GOTO [381] #274
	end
	if GunModel:FindFirstChild("GLaser", true) == nil then
		-- KONSTANTWARNING: GOTO [381] #274
	end
	-- KONSTANTERROR: [16] 15. Error Block 464 end (CF ANALYSIS FAILED)
end
function SetupViewmodelWithoutAnySettings(arg1) -- Line 2775
	--[[ Upvalues[3]:
		[1]: tbl_16_upvr (readonly)
		[2]: Unequip_upvr (readonly)
		[3]: tbl_6_upvr (readonly)
	]]
	-- KONSTANTERROR: [0] 1. Error Block 1 start (CF ANALYSIS FAILED)
	-- KONSTANTERROR: [0] 1. Error Block 1 end (CF ANALYSIS FAILED)
	-- KONSTANTERROR: [7] 6. Error Block 2 start (CF ANALYSIS FAILED)
	do
		return
	end
	-- KONSTANTERROR: [7] 6. Error Block 2 end (CF ANALYSIS FAILED)
	-- KONSTANTERROR: [8] 7. Error Block 3 start (CF ANALYSIS FAILED)
	-- KONSTANTERROR: [8] 7. Error Block 3 end (CF ANALYSIS FAILED)
end
_G.BandageFunc = SetupViewmodelWithoutAnySettings
local function hookTool_upvr(arg1) -- Line 2934, Named "hookTool"
	--[[ Upvalues[3]:
		[1]: Equip_upvr (readonly)
		[2]: Unequip_upvr (readonly)
		[3]: tbl_16_upvr (readonly)
	]]
	if not arg1:IsA("Tool") or not arg1:FindFirstChild("WeaponModules") then
	else
		arg1:SetAttribute("Hooked", true)
		tbl_16_upvr.CharacterJanitor:Add(arg1.Equipped:Connect(function() -- Line 2942
			--[[ Upvalues[2]:
				[1]: Equip_upvr (copied, readonly)
				[2]: arg1 (readonly)
			]]
			Equip_upvr(arg1)
		end), "Disconnect")
		tbl_16_upvr.CharacterJanitor:Add(arg1.Unequipped:Connect(Unequip_upvr), "Disconnect")
	end
end
local function FadeOutAndDestroy_upvr(arg1, arg2) -- Line 2950, Named "FadeOutAndDestroy"
	--[[ Upvalues[1]:
		[1]: tbl_16_upvr (readonly)
	]]
	if arg1 and arg1.Parent then
		local any_Create_result1_3 = tbl_16_upvr.TweenService:Create(arg1, TweenInfo.new(arg2, Enum.EasingStyle.Linear), {
			Volume = 0;
		})
		tbl_16_upvr.ViewmodelJanitor:Add(any_Create_result1_3, "Cancel")
		any_Create_result1_3:Play()
		local ViewmodelJanitor = tbl_16_upvr.ViewmodelJanitor
		local function var822_upvr() -- Line 2955
			--[[ Upvalues[1]:
				[1]: arg1 (readonly)
			]]
			if arg1 then
				arg1:Stop()
				arg1:Destroy()
			end
		end
		if not any_Create_result1_3 then return end
		local var824_upvw
		var824_upvw = any_Create_result1_3.Completed:Connect(function(...) -- Line 545
			--[[ Upvalues[2]:
				[1]: var824_upvw (read and write)
				[2]: var822_upvr (readonly)
			]]
			if var824_upvw then
				var824_upvw:Disconnect()
				var824_upvw = nil
			end
			var822_upvr(...)
		end)
		if ViewmodelJanitor then
			ViewmodelJanitor:Add(var824_upvw, "Disconnect")
		end
	end
end
local function initCharacter_upvr() -- Line 2964, Named "initCharacter"
	--[[ Upvalues[5]:
		[1]: tbl_16_upvr (readonly)
		[2]: hookTool_upvr (readonly)
		[3]: Unequip_upvr (readonly)
		[4]: tbl_6_upvr (readonly)
		[5]: FadeOutAndDestroy_upvr (readonly)
	]]
	-- KONSTANTERROR: [0] 1. Error Block 57 start (CF ANALYSIS FAILED)
	tbl_16_upvr.CharacterJanitor:Cleanup()
	local Character = tbl_16_upvr.LocalPlayer.Character
	if not Character then
		Character = tbl_16_upvr.LocalPlayer.CharacterAdded:Wait()
	end
	tbl_16_upvr.Character = Character
	tbl_16_upvr.humanoid = tbl_16_upvr.Character:WaitForChild("Humanoid")
	tbl_16_upvr.hrp = tbl_16_upvr.Character:WaitForChild("HumanoidRootPart")
	local var826 = tbl_16_upvr
	var826.Head = tbl_16_upvr.Character:WaitForChild("Head")
	if tbl_16_upvr.humanoid.RigType ~= Enum.HumanoidRigType.R6 then
		var826 = false
	else
		var826 = true
	end
	-- KONSTANTERROR: [0] 1. Error Block 57 end (CF ANALYSIS FAILED)
	-- KONSTANTERROR: [66] 46. Error Block 8 start (CF ANALYSIS FAILED)
	-- KONSTANTERROR: [66] 46. Error Block 8 end (CF ANALYSIS FAILED)
	-- KONSTANTERROR: [74] 52. Error Block 51 start (CF ANALYSIS FAILED)
	-- KONSTANTERROR: [74] 52. Error Block 51 end (CF ANALYSIS FAILED)
end
local function _() -- Line 3299, Named "GetHorizontalSpeed"
	--[[ Upvalues[1]:
		[1]: tbl_16_upvr (readonly)
	]]
	if not tbl_16_upvr.hrp then
		return 0
	end
	return (tbl_16_upvr.hrp.AssemblyLinearVelocity * Vector3.new(1, 0, 1)).Magnitude
end
local function _() -- Line 3304, Named "IsAirborne"
	--[[ Upvalues[1]:
		[1]: tbl_16_upvr (readonly)
	]]
	-- KONSTANTERROR: [0] 1. Error Block 1 start (CF ANALYSIS FAILED)
	-- KONSTANTERROR: [0] 1. Error Block 1 end (CF ANALYSIS FAILED)
	-- KONSTANTERROR: [4] 4. Error Block 6 start (CF ANALYSIS FAILED)
	local var827 = true
	if tbl_16_upvr.humanoid.FloorMaterial ~= Enum.Material.Air then
		-- KONSTANTERROR: [14] 10. Error Block 3 start (CF ANALYSIS FAILED)
		var827 = false
		-- KONSTANTERROR: [14] 10. Error Block 3 end (CF ANALYSIS FAILED)
	end
	do
		return var827
	end
	-- KONSTANTERROR: [4] 4. Error Block 6 end (CF ANALYSIS FAILED)
end
local function _() -- Line 3308, Named "IsJumping"
	--[[ Upvalues[1]:
		[1]: tbl_16_upvr (readonly)
	]]
	local var828
	if not tbl_16_upvr.humanoid then
		return false
	end
	var828 = tbl_16_upvr
	if var828.humanoid:GetState() ~= Enum.HumanoidStateType.Jumping then
		var828 = false
	else
		var828 = true
	end
	return var828
end
local function _() -- Line 3314, Named "IsMoving"
	--[[ Upvalues[1]:
		[1]: tbl_16_upvr (readonly)
	]]
	-- KONSTANTWARNING: Variable analysis failed. Output will have some incorrect variable assignments
	local var829
	if not var829 then
		var829 = false
		return var829
	end
	if not tbl_16_upvr.hrp then
		var829 = 0
	else
		var829 = (tbl_16_upvr.hrp.AssemblyLinearVelocity * Vector3.new(1, 0, 1)).Magnitude
	end
	if tbl_16_upvr.humanoid.WalkSpeed * 0.25 >= var829 then
	else
	end
	return true
end
local max_upvr = math.max
local function ComputeRecoilMultiplier_upvr() -- Line 3320, Named "ComputeRecoilMultiplier"
	--[[ Upvalues[3]:
		[1]: tbl_16_upvr (readonly)
		[2]: clamp_upvr (readonly)
		[3]: max_upvr (readonly)
	]]
	-- KONSTANTERROR: [0] 1. Error Block 80 start (CF ANALYSIS FAILED)
	local var831 = tbl_16_upvr
	if not tbl_16_upvr.humanoid then
		var831 = false
	elseif tbl_16_upvr.humanoid:GetState() ~= Enum.HumanoidStateType.Jumping then
		var831 = false
	else
		var831 = true
	end
	-- KONSTANTERROR: [0] 1. Error Block 80 end (CF ANALYSIS FAILED)
	-- KONSTANTERROR: [29] 22. Error Block 70 start (CF ANALYSIS FAILED)
	-- KONSTANTERROR: [29] 22. Error Block 70 end (CF ANALYSIS FAILED)
end
local function Recoil_upvr() -- Line 3371, Named "Recoil"
	--[[ Upvalues[2]:
		[1]: tbl_16_upvr (readonly)
		[2]: ComputeRecoilMultiplier_upvr (readonly)
	]]
	-- KONSTANTWARNING: Variable analysis failed. Output will have some incorrect variable assignments
	local RecoilProfile_2 = tbl_16_upvr.RecoilProfile
	local var846
	if not tbl_16_upvr.Assets.Viewmodel or not RecoilProfile_2 then
	else
		local time_result1_11 = time()
		var846 = tbl_16_upvr._lastRecoilTime or 0
		local var848 = time_result1_11 - var846
		var846 = 1
		if var848 < 0.3 then
			var846 = math.min(var848 * 2, 0.4) + 1
		else
			local RecoilModule_4 = tbl_16_upvr.RecoilModule
			if RecoilModule_4 and RecoilModule_4.Reset then
				RecoilModule_4:Reset()
			end
		end
		tbl_16_upvr._lastRecoilTime = time_result1_11
		local RecoilModule_3 = tbl_16_upvr.RecoilModule
		if RecoilModule_3 then
			if RecoilModule_3.Kick then
				RecoilModule_3:Kick(RecoilProfile_2, tbl_16_upvr.Assets.GunModel, ComputeRecoilMultiplier_upvr() * var846)
			end
		end
		if tbl_16_upvr.Assets.SettingsGun.AnimPack ~= "MachineGunPack" then
		else
		end
		if true then
			local Ammunition = tbl_16_upvr.Assets.GunModel:FindFirstChild("Ammunition")
			if Ammunition then
				local Cartridges = Ammunition:FindFirstChild("Cartridges")
				if Cartridges then
					local Value_2 = tbl_16_upvr.AmmoValue.Value
					if Value_2 <= 12 then
						local var854 = 12 - Value_2
						if 1 <= var854 then
							if var854 <= 12 then
								local SOME_7 = Cartridges:FindFirstChild("Cartridge"..var854)
								if SOME_7 then
									local SOME = SOME_7:FindFirstChild("Bullet"..var854)
									if SOME then
										SOME.Transparency = 1
									end
								end
							end
						end
					end
				end
			end
		end
		-- KONSTANTERROR: Expression was reused, decompilation is incorrect
		Ammunition = ComputeRecoilMultiplier_upvr() * var846 / 4
		local var857 = Ammunition
		if tbl_16_upvr.Aiming then
			var857 *= 0.65
		end
		tbl_16_upvr.Modules.RecoilCamera:Recoil(var857 * (0.8 + math.random() * 0.4), var857 * (1.2 + math.random() * 0.6), var857 * 2.5)
		tbl_16_upvr.Modules.ViewmodelController.FireKick(tbl_16_upvr.States, 0, -0.08, 0.05)
	end
end
local function DryFire_upvr() -- Line 3434, Named "DryFire"
	--[[ Upvalues[1]:
		[1]: tbl_16_upvr (readonly)
	]]
	local time_result1_12 = time()
	if time_result1_12 - tbl_16_upvr.lastDryFireAt < tbl_16_upvr.DRY_COOLDOWN then
	else
		if tbl_16_upvr.drySound and tbl_16_upvr.drySound:IsA("Sound") then
			tbl_16_upvr.drySound:Play()
		end
		tbl_16_upvr.BobbleModule:Trigger(tbl_16_upvr.Settings.BobbleDryFireTrigger)
		tbl_16_upvr.lastDryFireAt = time_result1_12
	end
end
local function _() -- Line 3442, Named "BoltPull"
	--[[ Upvalues[5]:
		[1]: tbl_16_upvr (readonly)
		[2]: SetAnimationSound_upvr (readonly)
		[3]: tbl_6_upvr (readonly)
		[4]: EjectShellNow_upvr (readonly)
		[5]: DryFire_upvr (readonly)
	]]
	-- KONSTANTWARNING: Variable analysis failed. Output will have some incorrect variable assignments
	-- KONSTANTERROR: [0] 1. Error Block 1 start (CF ANALYSIS FAILED)
	local var860
	-- KONSTANTERROR: [0] 1. Error Block 1 end (CF ANALYSIS FAILED)
	-- KONSTANTERROR: [4] 4. Error Block 41 start (CF ANALYSIS FAILED)
	local function INLINED_29() -- Internal function, doesn't exist in bytecode
		var860 = tbl_16_upvr.humanoid.PlatformStand
		return var860
	end
	if not tbl_16_upvr.humanoid or not INLINED_29() then
		var860 = false
	end
	if not tbl_16_upvr.equipping then
		if not tbl_16_upvr.Reloading then
			if not tbl_16_upvr.States.suppressorBusy and not tbl_16_upvr.States.GrenadeBusy then
				if tbl_16_upvr.States.StanceViewmodel == 0 then
					if not tbl_16_upvr.States.boltBusy and not tbl_16_upvr.States.Climbing then
					end
				end
			end
		end
	end
	if var860 then
		-- KONSTANTERROR: [57] 41. Error Block 32 start (CF ANALYSIS FAILED)
		do
			return false
		end
		-- KONSTANTERROR: [57] 41. Error Block 32 end (CF ANALYSIS FAILED)
	end
	var860 = tbl_16_upvr
	local function INLINED_30() -- Internal function, doesn't exist in bytecode
		var860 = tbl_16_upvr
		return var860.ChamberedValue
	end
	if not var860.AmmoValue or not INLINED_30() then
		return false
	end
	function var860() -- Line 3446
		--[[ Upvalues[5]:
			[1]: tbl_16_upvr (copied, readonly)
			[2]: SetAnimationSound_upvr (copied, readonly)
			[3]: tbl_6_upvr (copied, readonly)
			[4]: EjectShellNow_upvr (copied, readonly)
			[5]: DryFire_upvr (copied, readonly)
		]]
		-- KONSTANTWARNING: Variable analysis failed. Output will have some incorrect variable assignments
		-- KONSTANTERROR: [0] 1. Error Block 1 start (CF ANALYSIS FAILED)
		local var861
		-- KONSTANTERROR: [0] 1. Error Block 1 end (CF ANALYSIS FAILED)
		-- KONSTANTERROR: [4] 4. Error Block 124 start (CF ANALYSIS FAILED)
		var861 = tbl_16_upvr.Manual
		local CycleAnimName = var861.CycleAnimName
		if not CycleAnimName then
			-- KONSTANTERROR: [10] 8. Error Block 3 start (CF ANALYSIS FAILED)
			CycleAnimName = "Chamber"
			-- KONSTANTERROR: [10] 8. Error Block 3 end (CF ANALYSIS FAILED)
		end
		var861 = tbl_16_upvr.AnimationsTable[CycleAnimName]
		if not var861 then
			var861 = tbl_16_upvr.AnimationsTable.Chamber
		end
		local Aiming = tbl_16_upvr.Aiming
		if Aiming then
			AimFunction(false)
			task.wait(0.1)
		end
		if tbl_16_upvr.JammedValue then
			if tbl_16_upvr.JammedValue.Value then
				if var861 then
					var861:Play({
						snap = true;
						speed = math.random(100, 150) / 100;
					}, function(arg1, arg2) -- Line 3458
						--[[ Upvalues[2]:
							[1]: SetAnimationSound_upvr (copied, readonly)
							[2]: tbl_6_upvr (copied, readonly)
						]]
						if arg1 == "Sound" then
							SetAnimationSound_upvr("Bolt", arg2)
							local Gamepad1_upvr_6 = Enum.UserInputType.Gamepad1
							if tbl_6_upvr.UserInputService.GamepadEnabled then
								if tbl_6_upvr.HapticService:IsMotorSupported(Gamepad1_upvr_6, Enum.VibrationMotor.Large) then
									tbl_6_upvr.HapticService:SetMotor(Gamepad1_upvr_6, Enum.VibrationMotor.Large, 0.75)
								end
								if tbl_6_upvr.HapticService:IsMotorSupported(Gamepad1_upvr_6, Enum.VibrationMotor.Small) then
									tbl_6_upvr.HapticService:SetMotor(Gamepad1_upvr_6, Enum.VibrationMotor.Small, 0.44999999999999996)
								end
								task.delay(0.08, function() -- Line 3470
									--[[ Upvalues[2]:
										[1]: tbl_6_upvr (copied, readonly)
										[2]: Gamepad1_upvr_6 (readonly)
									]]
									tbl_6_upvr.HapticService:SetMotor(Gamepad1_upvr_6, Enum.VibrationMotor.Large, 0)
									tbl_6_upvr.HapticService:SetMotor(Gamepad1_upvr_6, Enum.VibrationMotor.Small, 0)
								end)
							end
						end
					end)
					tbl_16_upvr.LocalUtilities.BackPackSwitch(false, tbl_6_upvr)
					if tbl_16_upvr.Manual and tbl_16_upvr.Manual.EjectOn == "Cycle" then
						task.delay(tbl_16_upvr.Settings.EjectAt or 0.02, EjectShellNow_upvr)
					end
					var861.Stopped:Wait()
					tbl_16_upvr.LocalUtilities.BackPackSwitch(true, tbl_6_upvr)
				else
					if tbl_16_upvr.Manual then
						if tbl_16_upvr.Manual.EjectOn == "Cycle" then
							EjectShellNow_upvr()
						end
					end
					task.wait(0.25)
				end
				if tbl_16_upvr.ChamberedValue and tbl_16_upvr.ChamberedValue.Value ~= true then
					tbl_16_upvr.ChamberedValue.Value = true
				end
				if tbl_16_upvr.currentTool then
					tbl_16_upvr.currentTool:SetAttribute("ChamberedAttr", true)
				end
				tbl_16_upvr.JammedValue.Value = false
				tbl_16_upvr.BobbleModule:Trigger(tbl_16_upvr.Settings.BobbleReloadTrigger)
				if Aiming then
					task.wait(0.1)
					AimFunction(true)
				end
				return true
			end
		end
		local function INLINED_31() -- Internal function, doesn't exist in bytecode
			local var870
			return tbl_16_upvr.Manual.Type
		end
		if tbl_16_upvr.Manual and INLINED_31() and (tbl_16_upvr.Manual.NeedCycle or not tbl_16_upvr.ChamberedValue.Value) then
			if var861 then
				var861:Play({
					snap = true;
					speed = math.random(100, 150) / 100;
				}, function(arg1, arg2) -- Line 3500
					--[[ Upvalues[2]:
						[1]: SetAnimationSound_upvr (copied, readonly)
						[2]: tbl_6_upvr (copied, readonly)
					]]
					if arg1 == "Sound" then
						SetAnimationSound_upvr("Bolt", arg2)
						local Gamepad1_upvr_5 = Enum.UserInputType.Gamepad1
						if tbl_6_upvr.UserInputService.GamepadEnabled then
							if tbl_6_upvr.HapticService:IsMotorSupported(Gamepad1_upvr_5, Enum.VibrationMotor.Large) then
								tbl_6_upvr.HapticService:SetMotor(Gamepad1_upvr_5, Enum.VibrationMotor.Large, 0.75)
							end
							if tbl_6_upvr.HapticService:IsMotorSupported(Gamepad1_upvr_5, Enum.VibrationMotor.Small) then
								tbl_6_upvr.HapticService:SetMotor(Gamepad1_upvr_5, Enum.VibrationMotor.Small, 0.44999999999999996)
							end
							task.delay(0.08, function() -- Line 3512
								--[[ Upvalues[2]:
									[1]: tbl_6_upvr (copied, readonly)
									[2]: Gamepad1_upvr_5 (readonly)
								]]
								tbl_6_upvr.HapticService:SetMotor(Gamepad1_upvr_5, Enum.VibrationMotor.Large, 0)
								tbl_6_upvr.HapticService:SetMotor(Gamepad1_upvr_5, Enum.VibrationMotor.Small, 0)
							end)
						end
					end
				end)
				tbl_16_upvr.LocalUtilities.BackPackSwitch(false, tbl_6_upvr)
				if tbl_16_upvr.Manual.EjectOn == "Cycle" then
					task.delay(tbl_16_upvr.Settings.EjectAt or 0.02, EjectShellNow_upvr)
				end
				var861.Stopped:Wait()
				tbl_16_upvr.LocalUtilities.BackPackSwitch(true, tbl_6_upvr)
			else
				if tbl_16_upvr.Manual.EjectOn == "Cycle" then
					EjectShellNow_upvr()
				end
				task.wait(0.2)
			end
			local any_ChamberFromMag_result1 = tbl_16_upvr.Modules.MagazineController.ChamberFromMag(tbl_16_upvr.currentTool)
			if any_ChamberFromMag_result1 then
				local _ = true
			else
			end
			if tbl_16_upvr.ChamberedValue and tbl_16_upvr.ChamberedValue.Value ~= false then
				-- KONSTANTERROR: Expression was reused, decompilation is incorrect
				tbl_16_upvr.ChamberedValue.Value = false
			end
			if tbl_16_upvr.currentTool then
				-- KONSTANTERROR: Expression was reused, decompilation is incorrect
				tbl_16_upvr.currentTool:SetAttribute("ChamberedAttr", false)
			end
			tbl_16_upvr.Manual.NeedCycle = false
			if any_ChamberFromMag_result1 then
				tbl_16_upvr.BobbleModule:Trigger(tbl_16_upvr.Settings.BobbleReloadTrigger)
				if Aiming then
					task.wait(0.1)
					AimFunction(true)
				end
				return true
			end
			DryFire_upvr()
			return false
		end
		if tbl_16_upvr.ChamberedValue.Value then
			if Aiming then
				task.wait(0.1)
				AimFunction(true)
			end
			return true
		end
		if tbl_16_upvr.Modules.MagazineController.ChamberFromMag(tbl_16_upvr.currentTool) then
			if var861 then
				var861:Play({
					snap = true;
					speed = math.random(100, 150) / 100;
				}, function(arg1, arg2) -- Line 3559
					--[[ Upvalues[1]:
						[1]: SetAnimationSound_upvr (copied, readonly)
					]]
					if arg1 == "Sound" then
						SetAnimationSound_upvr("Bolt", arg2)
					end
				end)
				tbl_16_upvr.LocalUtilities.BackPackSwitch(false, tbl_6_upvr)
				var861.Stopped:Wait()
				tbl_16_upvr.LocalUtilities.BackPackSwitch(true, tbl_6_upvr)
			else
				task.wait(0.25)
			end
			if tbl_16_upvr.ChamberedValue and tbl_16_upvr.ChamberedValue.Value ~= true then
				tbl_16_upvr.ChamberedValue.Value = true
			end
			if tbl_16_upvr.currentTool then
				tbl_16_upvr.currentTool:SetAttribute("ChamberedAttr", true)
			end
			if Aiming then
				task.wait(0.1)
				AimFunction(true)
			end
			return true
		end
		DryFire_upvr()
		do
			return false
		end
		-- KONSTANTERROR: [4] 4. Error Block 124 end (CF ANALYSIS FAILED)
	end
	if tbl_16_upvr.States.boltBusy then
		return false
	end
	tbl_16_upvr.States.boltBusy = true
	local pcall_result1, pcall_result2_5 = pcall(var860)
	tbl_16_upvr.States.boltBusy = false
	if not pcall_result1 then
		warn("boltBusy error:", pcall_result2_5)
	end
	do
		return pcall_result1
	end
	-- KONSTANTERROR: [4] 4. Error Block 41 end (CF ANALYSIS FAILED)
end
local Gamepad1_upvr = Enum.UserInputType.Gamepad1
local Large_upvr = Enum.VibrationMotor.Large
local Small_upvr = Enum.VibrationMotor.Small
local var884_upvw
local var885_upvw
task.defer(function() -- Line 3591
	--[[ Upvalues[6]:
		[1]: var884_upvw (read and write)
		[2]: tbl_6_upvr (readonly)
		[3]: Gamepad1_upvr (readonly)
		[4]: Large_upvr (readonly)
		[5]: var885_upvw (read and write)
		[6]: Small_upvr (readonly)
	]]
	var884_upvw = tbl_6_upvr.HapticService:IsMotorSupported(Gamepad1_upvr, Large_upvr)
	var885_upvw = tbl_6_upvr.HapticService:IsMotorSupported(Gamepad1_upvr, Small_upvr)
end)
local GamepadEnabled_upvr = tbl_6_upvr.UserInputService.GamepadEnabled
local function Vibrate_upvr(arg1, arg2, arg3) -- Line 3596, Named "Vibrate"
	--[[ Upvalues[8]:
		[1]: GamepadEnabled_upvr (readonly)
		[2]: clamp_upvr (readonly)
		[3]: var884_upvw (read and write)
		[4]: tbl_6_upvr (readonly)
		[5]: Gamepad1_upvr (readonly)
		[6]: Large_upvr (readonly)
		[7]: var885_upvw (read and write)
		[8]: Small_upvr (readonly)
	]]
	if not GamepadEnabled_upvr then
	else
		if arg1 <= 0 then return end
		local var8_result1 = clamp_upvr(arg1, 0, 1)
		if var884_upvw then
			tbl_6_upvr.HapticService:SetMotor(Gamepad1_upvr, Large_upvr, var8_result1)
		end
		if var885_upvw then
			tbl_6_upvr.HapticService:SetMotor(Gamepad1_upvr, Small_upvr, var8_result1 * (arg2 or 1))
		end
		if arg3 then
			if 0 < arg3 then
				task.delay(arg3, function() -- Line 3611
					--[[ Upvalues[6]:
						[1]: var884_upvw (copied, read and write)
						[2]: tbl_6_upvr (copied, readonly)
						[3]: Gamepad1_upvr (copied, readonly)
						[4]: Large_upvr (copied, readonly)
						[5]: var885_upvw (copied, read and write)
						[6]: Small_upvr (copied, readonly)
					]]
					if var884_upvw then
						tbl_6_upvr.HapticService:SetMotor(Gamepad1_upvr, Large_upvr, 0)
					end
					if var885_upvw then
						tbl_6_upvr.HapticService:SetMotor(Gamepad1_upvr, Small_upvr, 0)
					end
				end)
			end
		end
	end
end
local function Reload_upvr() -- Line 3618, Named "Reload"
	--[[ Upvalues[8]:
		[1]: tbl_16_upvr (readonly)
		[2]: UpdateRocketVisibility_upvr (readonly)
		[3]: tbl_6_upvr (readonly)
		[4]: SetAnimationSound_upvr (readonly)
		[5]: Vibrate_upvr (readonly)
		[6]: RefreshInsertVisuals_upvr (readonly)
		[7]: EjectShellNow_upvr (readonly)
		[8]: DryFire_upvr (readonly)
	]]
	-- KONSTANTERROR: [0] 1. Error Block 1 start (CF ANALYSIS FAILED)
	local var892
	-- KONSTANTERROR: [0] 1. Error Block 1 end (CF ANALYSIS FAILED)
	-- KONSTANTERROR: [4] 4. Error Block 189 start (CF ANALYSIS FAILED)
	local function INLINED_34() -- Internal function, doesn't exist in bytecode
		var892 = tbl_16_upvr.humanoid.PlatformStand
		return var892
	end
	if not tbl_16_upvr.humanoid or not INLINED_34() then
		var892 = false
	end
	local equipping_2 = tbl_16_upvr.equipping
	if not equipping_2 then
		equipping_2 = tbl_16_upvr.Reloading
		if not equipping_2 then
			equipping_2 = tbl_16_upvr.States.suppressorBusy
			if not equipping_2 then
				equipping_2 = tbl_16_upvr.States.GrenadeBusy
				if not equipping_2 then
					equipping_2 = true
					if tbl_16_upvr.States.StanceViewmodel == 0 then
						equipping_2 = tbl_16_upvr.States.boltBusy
						if not equipping_2 then
							equipping_2 = tbl_16_upvr.States.Climbing
							if not equipping_2 then
								equipping_2 = var892
							end
						end
					end
				end
			end
		end
	end
	local function INLINED_35() -- Internal function, doesn't exist in bytecode
		var892 = tbl_16_upvr
		return var892.currentTool
	end
	if equipping_2 or not INLINED_35() then
		-- KONSTANTERROR: [61] 44. Error Block 16 start (CF ANALYSIS FAILED)
		do
			return
		end
		-- KONSTANTERROR: [61] 44. Error Block 16 end (CF ANALYSIS FAILED)
	end
	var892 = tbl_16_upvr.Modules.MagazineController
	var892 = tbl_16_upvr.currentTool
	-- KONSTANTERROR: [4] 4. Error Block 189 end (CF ANALYSIS FAILED)
end
local function FireShot_upvr(arg1) -- Line 3887, Named "FireShot"
	--[[ Upvalues[11]:
		[1]: tbl_16_upvr (readonly)
		[2]: DryFire_upvr (readonly)
		[3]: Recoil_upvr (readonly)
		[4]: randomConeDirection_upvr (readonly)
		[5]: var7_upvw (read and write)
		[6]: SetAnimationSound_upvr (readonly)
		[7]: tbl_6_upvr (readonly)
		[8]: EjectShellNow_upvr (readonly)
		[9]: MuzzleFX_upvr (readonly)
		[10]: UpdateRocketVisibility_upvr (readonly)
		[11]: updateMagHUD_upvr (readonly)
	]]
	-- KONSTANTERROR: [0] 1. Error Block 1 start (CF ANALYSIS FAILED)
	-- KONSTANTERROR: [0] 1. Error Block 1 end (CF ANALYSIS FAILED)
	-- KONSTANTERROR: [4] 4. Error Block 2 start (CF ANALYSIS FAILED)
	do
		return
	end
	-- KONSTANTERROR: [4] 4. Error Block 2 end (CF ANALYSIS FAILED)
	-- KONSTANTERROR: [5] 5. Error Block 3 start (CF ANALYSIS FAILED)
	-- KONSTANTERROR: [5] 5. Error Block 3 end (CF ANALYSIS FAILED)
end
local function _() -- Line 4140, Named "CanFireNow"
	--[[ Upvalues[2]:
		[1]: tbl_16_upvr (readonly)
		[2]: time_upvr (readonly)
	]]
	-- KONSTANTWARNING: Variable analysis failed. Output will have some incorrect variable assignments
	local currentTool_6 = tbl_16_upvr.currentTool
	local var895
	if not currentTool_6 then
		var895 = nil
	else
		if not tbl_16_upvr.PerToolState[currentTool_6] then
			local var897 = {
				nextShotTime = 0;
				lastShotAt = 0;
				rapidStreak = 0;
				Overheated = false;
				Heat = 0;
			}
			tbl_16_upvr.PerToolState[currentTool_6] = var897
		end
		var895 = var897
	end
	if not var895 then
		return false
	end
	local time_upvr_result1 = time_upvr()
	if 1 < time_upvr_result1 - var895.nextShotTime then
		var895.nextShotTime = time_upvr_result1
	end
	if var895.nextShotTime > time_upvr_result1 then
	else
	end
	return true
end
tbl_16_upvr.SFXShake = {
	Jam = {
		t = 0.05;
		k = 0.2;
		bobble = 0.18;
	};
	EmptyMag = {
		t = 0.05;
		k = 0.2;
		bobble = 0.18;
	};
	Unchambered = {
		t = 0.05;
		k = 0.2;
		bobble = 0.18;
	};
}
local tbl_5_upvr = {
	fireQueued = false;
	queueTime = 0;
	BUFFER_WINDOW = 0.15;
}
local function _() -- Line 4162, Named "QueueFire"
	--[[ Upvalues[1]:
		[1]: tbl_5_upvr (readonly)
	]]
	tbl_5_upvr.fireQueued = true
	tbl_5_upvr.queueTime = time()
end
local function _() -- Line 4167, Named "ConsumeFireQueue"
	--[[ Upvalues[1]:
		[1]: tbl_5_upvr (readonly)
	]]
	if not tbl_5_upvr.fireQueued then
		return false
	end
	if tbl_5_upvr.BUFFER_WINDOW < time() - tbl_5_upvr.queueTime then
		tbl_5_upvr.fireQueued = false
		return false
	end
	tbl_5_upvr.fireQueued = false
	return true
end
local function _() -- Line 4180, Named "TryFireWithBuffer"
	--[[ Upvalues[3]:
		[1]: tbl_16_upvr (readonly)
		[2]: tbl_5_upvr (readonly)
		[3]: FireShot_upvr (readonly)
	]]
	-- KONSTANTWARNING: Variable analysis failed. Output will have some incorrect variable assignments
	-- KONSTANTERROR: [0] 1. Error Block 36 start (CF ANALYSIS FAILED)
	local currentTool = tbl_16_upvr.currentTool
	local var905
	if not currentTool then
		var905 = nil
	else
		if not tbl_16_upvr.PerToolState[currentTool] then
			local var907 = {
				nextShotTime = 0;
				lastShotAt = 0;
				rapidStreak = 0;
				Overheated = false;
				Heat = 0;
			}
			tbl_16_upvr.PerToolState[currentTool] = var907
		end
		var905 = var907
	end
	if not var905 then return end
	if time() < var905.nextShotTime then
		tbl_5_upvr.fireQueued = true
		tbl_5_upvr.queueTime = time()
		return
	end
	if not tbl_5_upvr.fireQueued then
		-- KONSTANTWARNING: GOTO [82] #62
	end
	if tbl_5_upvr.BUFFER_WINDOW < time() - tbl_5_upvr.queueTime then
		tbl_5_upvr.fireQueued = false
	else
		tbl_5_upvr.fireQueued = false
	end
	-- KONSTANTERROR: [0] 1. Error Block 36 end (CF ANALYSIS FAILED)
	-- KONSTANTERROR: [82] 62. Error Block 18 start (CF ANALYSIS FAILED)
	-- KONSTANTERROR: [82] 62. Error Block 18 end (CF ANALYSIS FAILED)
end
local const_number_upvw_2 = 0
local const_number_upvw_4 = 0
local const_number_upvw = 0
local function TryFireOnce_upvr() -- Line 4200, Named "TryFireOnce"
	--[[ Upvalues[12]:
		[1]: tbl_16_upvr (readonly)
		[2]: const_number_upvw_2 (read and write)
		[3]: const_number_upvw_4 (read and write)
		[4]: tbl_5_upvr (readonly)
		[5]: tbl_6_upvr (readonly)
		[6]: DryFire_upvr (readonly)
		[7]: SetAnimationSound_upvr (readonly)
		[8]: EjectShellNow_upvr (readonly)
		[9]: time_upvr (readonly)
		[10]: FireShot_upvr (readonly)
		[11]: const_number_upvw (read and write)
		[12]: softThrottleFactor_upvr (readonly)
	]]
	-- KONSTANTERROR: [0] 1. Error Block 1 start (CF ANALYSIS FAILED)
	-- KONSTANTERROR: [0] 1. Error Block 1 end (CF ANALYSIS FAILED)
	-- KONSTANTERROR: [57] 41. Error Block 178 start (CF ANALYSIS FAILED)
	do
		return false
	end
	-- KONSTANTERROR: [57] 41. Error Block 178 end (CF ANALYSIS FAILED)
end
local function _(arg1) -- Line 4329, Named "FOVToPercent"
	return arg1 / 70
end
local function GetTargetFOV_upvr() -- Line 4334, Named "GetTargetFOV"
	--[[ Upvalues[1]:
		[1]: tbl_16_upvr (readonly)
	]]
	local AimMode = tbl_16_upvr.AimMode
	if AimMode == 1 then
		AimMode = ""
	end
	if not tbl_16_upvr.Assets.GunModel then return end
	local GunModel_2 = tbl_16_upvr.Assets.GunModel
	if GunModel_2:FindFirstChild("AimPart"..AimMode) then
		local Zoom = GunModel_2:FindFirstChild("AimPart"..AimMode):FindFirstChild("Zoom")
		if Zoom then
			return (Zoom.Value or 50) / 70
		end
		return (tbl_16_upvr.Assets.SettingsGun.ChangeFOV[tbl_16_upvr.AimMode] or 50) / 70
	end
	return 0.5714285714285714
end
local function ChangeAim_upvr() -- Line 4354, Named "ChangeAim"
	--[[ Upvalues[6]:
		[1]: tbl_16_upvr (readonly)
		[2]: totalmodes_upvr (readonly)
		[3]: FindCurrentAimPart_upvr (readonly)
		[4]: GetTargetFOV_upvr (readonly)
		[5]: TFov_upvr (readonly)
		[6]: DoAdsMesh_upvr (readonly)
	]]
	if tbl_16_upvr.States.BlindFire then
	else
		if not tbl_16_upvr.Assets.SettingsGun then return end
		local totalmodes_result1 = totalmodes_upvr()
		if totalmodes_result1 < 1 then return end
		local var917 = tbl_16_upvr
		var917.AimMode += 1
		if totalmodes_result1 < tbl_16_upvr.AimMode then
			tbl_16_upvr.AimMode = 1
		end
		local FindCurrentAimPart_upvr_result1_3 = FindCurrentAimPart_upvr()
		if not FindCurrentAimPart_upvr_result1_3 then
			tbl_16_upvr.AimMode = tbl_16_upvr.AimMode
			return
		end
		if tbl_16_upvr._lpvo then
			tbl_16_upvr._lpvo.AimPart = FindCurrentAimPart_upvr_result1_3
		end
		if tbl_16_upvr.currentTool then
			tbl_16_upvr.currentTool:SetAttribute("AimMode", tbl_16_upvr.AimMode)
		end
		tbl_16_upvr.BobbleModule:Trigger(tbl_16_upvr.Settings.BobbleChangeAimTrigger)
		if tbl_16_upvr.Aiming then
			if tbl_16_upvr.Assets._activeTweens and tbl_16_upvr.Assets._activeTweens.ads then
				for _, v_40_upvr in pairs(tbl_16_upvr.Assets._activeTweens.ads) do
					pcall(function() -- Line 4390
						--[[ Upvalues[1]:
							[1]: v_40_upvr (readonly)
						]]
						v_40_upvr:Cancel()
					end)
				end
				table.clear(tbl_16_upvr.Assets._activeTweens.ads)
			end
			TFov_upvr(workspace:GetAttribute("FieldOfView") * GetTargetFOV_upvr() or 70)
			DoAdsMesh_upvr(true)
		end
	end
end
function findAimPart(arg1) -- Line 4404
	--[[ Upvalues[1]:
		[1]: tbl_16_upvr (readonly)
	]]
	-- KONSTANTERROR: [0] 1. Error Block 11 start (CF ANALYSIS FAILED)
	if arg1 == 1 then
		if tbl_16_upvr.Assets.GunModel:FindFirstChild("AimPart") then
			do
				return true
			end
			-- KONSTANTWARNING: GOTO [24] #20
		end
	elseif tbl_16_upvr.Assets.GunModel:FindFirstChild("AimPart"..arg1) then
		return true
	end
	-- KONSTANTERROR: [0] 1. Error Block 11 end (CF ANALYSIS FAILED)
	-- KONSTANTERROR: [24] 20. Error Block 7 start (CF ANALYSIS FAILED)
	do
		return false
	end
	-- KONSTANTERROR: [24] 20. Error Block 7 end (CF ANALYSIS FAILED)
end
function ApplyAimFOVAndMesh() -- Line 4421
	--[[ Upvalues[4]:
		[1]: tbl_16_upvr (readonly)
		[2]: GetTargetFOV_upvr (readonly)
		[3]: tbl_6_upvr (readonly)
		[4]: DoAdsMesh_upvr (readonly)
	]]
	-- KONSTANTWARNING: Variable analysis failed. Output will have some incorrect variable assignments
	local var932_upvr
	if not tbl_16_upvr.Camera then
	else
		var932_upvr = workspace:GetAttribute("FieldOfView")
		local var933 = tonumber(var932_upvr) or 70
		local var934 = 0.15
		var932_upvr = tbl_16_upvr.Aiming
		if var932_upvr then
			var932_upvr = tbl_16_upvr._lpvo
			if var932_upvr then
				var932_upvr = tbl_16_upvr._lpvo.enabled
				if var932_upvr then
					var932_upvr = tbl_16_upvr._lpvo.AimPart
					if var932_upvr then
						var932_upvr = tbl_16_upvr._lpvo.AimPart:FindFirstChild("LPVO")
						if var932_upvr then
							var932_upvr = tonumber(tbl_16_upvr._lpvo.AimPart.LPVO.FOV.Value)
							var933 = var932_upvr or 70
							var934 = 0.12
							-- KONSTANTWARNING: GOTO [70] #52
						end
					end
				end
			end
			var932_upvr = GetTargetFOV_upvr()
			if var932_upvr then
				var933 *= var932_upvr
			end
			var934 = 0.18
		end
		var932_upvr = tonumber(var933)
		var932_upvr = tbl_16_upvr.Assets._activeTweens
		if var932_upvr then
			var932_upvr = tbl_16_upvr.Assets._activeTweens.fov
		end
		if var932_upvr then
			pcall(function() -- Line 530
				--[[ Upvalues[1]:
					[1]: var932_upvr (readonly)
				]]
				var932_upvr:Cancel()
			end)
		end
		var932_upvr = tbl_16_upvr.Assets._activeTweens
		if var932_upvr then
			var932_upvr = tbl_16_upvr.Assets._activeTweens.dof
		end
		if var932_upvr then
			pcall(function() -- Line 530
				--[[ Upvalues[1]:
					[1]: var932_upvr (readonly)
				]]
				var932_upvr:Cancel()
			end)
		end
		var932_upvr = tbl_6_upvr.Tween
		var932_upvr = var932_upvr:Create(tbl_16_upvr.Camera, TweenInfo.new(var934, Enum.EasingStyle.Sine, Enum.EasingDirection.Out), {
			FieldOfView = var932_upvr or 70;
		})
		tbl_16_upvr.Assets._activeTweens.fov = var932_upvr
		var932_upvr:Play()
		if tbl_16_upvr.Aiming then
		else
		end
		local any_Create_result1 = tbl_6_upvr.Tween:Create(tbl_16_upvr.Assets.AimBlur, TweenInfo.new(var934, Enum.EasingStyle.Sine, Enum.EasingDirection.Out), {
			InFocusRadius = 2;
		})
		tbl_16_upvr.Assets._activeTweens.dof = any_Create_result1
		any_Create_result1:Play()
		task.delay(0.02, function() -- Line 4464
			--[[ Upvalues[2]:
				[1]: DoAdsMesh_upvr (copied, readonly)
				[2]: tbl_16_upvr (copied, readonly)
			]]
			DoAdsMesh_upvr(tbl_16_upvr.Aiming)
		end)
	end
end
local function _() -- Line 4473, Named "ShouldAllowAiming"
	--[[ Upvalues[1]:
		[1]: tbl_16_upvr (readonly)
	]]
	if tbl_16_upvr.Reloading then
		return false
	end
	if tbl_16_upvr.equipping then
		return false
	end
	if tbl_16_upvr.States.suppressorBusy then
		return false
	end
	if tbl_16_upvr.States.GrenadeBusy then
		return false
	end
	if tbl_16_upvr.States.boltBusy then
		return false
	end
	if tbl_16_upvr.States.Climbing then
		return false
	end
	if tbl_16_upvr.Punching then
		return false
	end
	if tbl_16_upvr.humanoid and tbl_16_upvr.humanoid.PlatformStand then
		return false
	end
	return true
end
local const_number_upvw_3 = 0
local var942_upvw
function AimFunction(arg1) -- Line 4486
	--[[ Upvalues[13]:
		[1]: tbl_16_upvr (readonly)
		[2]: const_number_upvw_3 (read and write)
		[3]: var942_upvw (read and write)
		[4]: FindCurrentAimPart_upvr (readonly)
		[5]: SetProjectorSightVisible_upvr (readonly)
		[6]: FadeOutAndDestroy_upvr (readonly)
		[7]: tbl_6_upvr (readonly)
		[8]: any_new_result1_upvr (readonly)
		[9]: totalmodes_upvr (readonly)
		[10]: ChangeAim_upvr (readonly)
		[11]: var777_upvw (read and write)
		[12]: var776_upvw (read and write)
		[13]: UpdateKeybindVisibility_upvr (readonly)
	]]
	-- KONSTANTERROR: [0] 1. Error Block 1 start (CF ANALYSIS FAILED)
	-- KONSTANTERROR: [0] 1. Error Block 1 end (CF ANALYSIS FAILED)
	-- KONSTANTERROR: [4] 4. Error Block 2 start (CF ANALYSIS FAILED)
	do
		return
	end
	-- KONSTANTERROR: [4] 4. Error Block 2 end (CF ANALYSIS FAILED)
	-- KONSTANTERROR: [5] 5. Error Block 3 start (CF ANALYSIS FAILED)
	-- KONSTANTERROR: [5] 5. Error Block 3 end (CF ANALYSIS FAILED)
end
local function FireLoop_Auto_upvr(arg1) -- Line 4647, Named "FireLoop_Auto"
	--[[ Upvalues[5]:
		[1]: tbl_16_upvr (readonly)
		[2]: TryFireOnce_upvr (readonly)
		[3]: HeartbeatWait_upvr (readonly)
		[4]: time_upvr (readonly)
		[5]: tbl_6_upvr (readonly)
	]]
	-- KONSTANTERROR: [0] 1. Error Block 1 start (CF ANALYSIS FAILED)
	local var943 = tbl_16_upvr
	var943._activeFireLoopId += 1
	tbl_16_upvr.isFiring = true
	-- KONSTANTERROR: [0] 1. Error Block 1 end (CF ANALYSIS FAILED)
	-- KONSTANTERROR: [200] 145. Error Block 50 start (CF ANALYSIS FAILED)
	-- KONSTANTERROR: [200] 145. Error Block 50 end (CF ANALYSIS FAILED)
	-- KONSTANTERROR: [13] 10. Error Block 2 start (CF ANALYSIS FAILED)
	-- KONSTANTERROR: Expression was reused, decompilation is incorrect
	-- KONSTANTERROR: [13] 10. Error Block 2 end (CF ANALYSIS FAILED)
end
local function FireLoop_Burst_upvr(arg1, arg2) -- Line 4680, Named "FireLoop_Burst"
	--[[ Upvalues[4]:
		[1]: tbl_16_upvr (readonly)
		[2]: TryFireOnce_upvr (readonly)
		[3]: time_upvr (readonly)
		[4]: tbl_6_upvr (readonly)
	]]
	-- KONSTANTERROR: [0] 1. Error Block 1 start (CF ANALYSIS FAILED)
	local var944 = tbl_16_upvr
	var944._activeFireLoopId += 1
	tbl_16_upvr.isFiring = true
	-- KONSTANTERROR: [0] 1. Error Block 1 end (CF ANALYSIS FAILED)
	-- KONSTANTERROR: [118] 87. Error Block 28 start (CF ANALYSIS FAILED)
	-- KONSTANTERROR: [118] 87. Error Block 28 end (CF ANALYSIS FAILED)
	-- KONSTANTERROR: [17] 14. Error Block 2 start (CF ANALYSIS FAILED)
	-- KONSTANTWARNING: Failed to evaluate expression, replaced with nil [118.6]
	-- KONSTANTERROR: [17] 14. Error Block 2 end (CF ANALYSIS FAILED)
end
local function getFlashlightToggles_upvr() -- Line 4696, Named "getFlashlightToggles"
	--[[ Upvalues[1]:
		[1]: tbl_16_upvr (readonly)
	]]
	-- KONSTANTERROR: [0] 1. Error Block 1 start (CF ANALYSIS FAILED)
	-- KONSTANTERROR: [0] 1. Error Block 1 end (CF ANALYSIS FAILED)
	-- KONSTANTERROR: [4] 4. Error Block 32 start (CF ANALYSIS FAILED)
	if not tbl_16_upvr.Assets.GunModel then
		-- KONSTANTERROR: [10] 8. Error Block 26 start (CF ANALYSIS FAILED)
		do
			return nil
		end
		-- KONSTANTERROR: [10] 8. Error Block 26 end (CF ANALYSIS FAILED)
	end
	local var959
	if not tbl_16_upvr.Assets._flashlightToggles then
		local tbl_2 = {}
		var959 = tbl_16_upvr.Assets.GunModel:GetDescendants()
		local pairs_result1_15, pairs_result2_20, pairs_result3_13 = pairs(var959)
		for _, v_25 in pairs_result1_15, pairs_result2_20, pairs_result3_13 do
			if v_25.Name == "GFlash" then
				if v_25:IsA("BasePart") then
					local Enabled = v_25:FindFirstChild("Enabled")
					if Enabled and Enabled:IsA("BoolValue") then
						table.insert(tbl_2, Enabled)
					end
				end
			end
		end
		pairs_result2_20 = tbl_16_upvr
		local function INLINED_37() -- Internal function, doesn't exist in bytecode
			pairs_result2_20 = tbl_2
			return pairs_result2_20
		end
		if 0 >= #tbl_2 or not INLINED_37() then
			pairs_result2_20 = nil
		end
		pairs_result2_20.Assets._flashlightToggles = pairs_result2_20
	end
	do
		return tbl_16_upvr.Assets._flashlightToggles
	end
	-- KONSTANTERROR: [4] 4. Error Block 32 end (CF ANALYSIS FAILED)
end
local function _() -- Line 4713, Named "spawnAutoLoop"
	--[[ Upvalues[3]:
		[1]: tbl_16_upvr (readonly)
		[2]: TryFireOnce_upvr (readonly)
		[3]: FireLoop_Auto_upvr (readonly)
	]]
	if tbl_16_upvr.Manual.Type then
		TryFireOnce_upvr()
	else
		if tbl_16_upvr.isFiring then return end
		local _equipToken_upvr = tbl_16_upvr._equipToken
		task.spawn(function() -- Line 4720
			--[[ Upvalues[2]:
				[1]: FireLoop_Auto_upvr (copied, readonly)
				[2]: _equipToken_upvr (readonly)
			]]
			FireLoop_Auto_upvr(_equipToken_upvr)
		end)
	end
end
local function spawnBurstLoop_upvr() -- Line 4723, Named "spawnBurstLoop"
	--[[ Upvalues[2]:
		[1]: tbl_16_upvr (readonly)
		[2]: FireLoop_Burst_upvr (readonly)
	]]
	local var967_upvr
	if tbl_16_upvr.isFiring then
	else
		var967_upvr = tbl_16_upvr
		local function INLINED_38() -- Internal function, doesn't exist in bytecode
			var967_upvr = tbl_16_upvr.Assets.SettingsGun.BurstShot
			return var967_upvr
		end
		if not tbl_16_upvr.Assets.SettingsGun or not INLINED_38() then
			var967_upvr = tbl_16_upvr.Settings.BurstCountDefault
			if not var967_upvr then
				var967_upvr = 3
			end
		end
		local _equipToken_upvr_2 = var967_upvr._equipToken
		task.spawn(function() -- Line 4727
			--[[ Upvalues[3]:
				[1]: FireLoop_Burst_upvr (copied, readonly)
				[2]: _equipToken_upvr_2 (readonly)
				[3]: var967_upvr (readonly)
			]]
			FireLoop_Burst_upvr(_equipToken_upvr_2, var967_upvr)
		end)
	end
end
local function SwitchFireMode_upvr() -- Line 4730, Named "SwitchFireMode"
	--[[ Upvalues[6]:
		[1]: tbl_16_upvr (readonly)
		[2]: SetAnimationSound_upvr (readonly)
		[3]: var777_upvw (read and write)
		[4]: var776_upvw (read and write)
		[5]: UpdateKeybindVisibility_upvr (readonly)
		[6]: tbl_6_upvr (readonly)
	]]
	-- KONSTANTERROR: [0] 1. Error Block 1 start (CF ANALYSIS FAILED)
	-- KONSTANTERROR: [0] 1. Error Block 1 end (CF ANALYSIS FAILED)
	-- KONSTANTERROR: [6] 5. Error Block 2 start (CF ANALYSIS FAILED)
	-- KONSTANTERROR: [6] 5. Error Block 2 end (CF ANALYSIS FAILED)
	-- KONSTANTERROR: [69] 48. Error Block 16 start (CF ANALYSIS FAILED)
	do
		return
	end
	-- KONSTANTERROR: [69] 48. Error Block 16 end (CF ANALYSIS FAILED)
end
tbl_16_upvr.Functions.SwitchFireMode = SwitchFireMode_upvr
local function GrenadeBang_upvr() -- Line 4813, Named "GrenadeBang"
	--[[ Upvalues[2]:
		[1]: tbl_16_upvr (readonly)
		[2]: updateMagHUD_upvr (readonly)
	]]
	-- KONSTANTERROR: [0] 1. Error Block 1 start (CF ANALYSIS FAILED)
	-- KONSTANTERROR: [0] 1. Error Block 1 end (CF ANALYSIS FAILED)
	-- KONSTANTERROR: [4] 4. Error Block 20 start (CF ANALYSIS FAILED)
	if not tbl_16_upvr.Assets.GunModel then
		-- KONSTANTERROR: [10] 8. Error Block 3 start (CF ANALYSIS FAILED)
		do
			return
		end
		-- KONSTANTERROR: [10] 8. Error Block 3 end (CF ANALYSIS FAILED)
	end
	if tbl_16_upvr.Modules.MagazineController.Fire(tbl_16_upvr.currentTool) then
		updateMagHUD_upvr()
	end
	for _, v_26 in pairs({
		PullRing = tbl_16_upvr.Assets.GunModel:FindFirstChild("PullRing");
		Lever = tbl_16_upvr.Assets.GunModel:FindFirstChild("Lever");
		SafetyPin = tbl_16_upvr.Assets.GunModel:FindFirstChild("SafetyPin");
		Grenade = tbl_16_upvr.Assets.GunModel:FindFirstChild("Grenade");
	}) do
		if v_26 and v_26:IsA("BasePart") then
			v_26.Transparency = 1
		end
	end
	;({}).LookVector = workspace.CurrentCamera.CFrame.LookVector * 15 + Vector3.new(0, 2, 0)
	-- KONSTANTERROR: [4] 4. Error Block 20 end (CF ANALYSIS FAILED)
end
local function ResetGrenade_upvr() -- Line 4844, Named "ResetGrenade"
	--[[ Upvalues[2]:
		[1]: tbl_16_upvr (readonly)
		[2]: tbl_6_upvr (readonly)
	]]
	local time_result1_10 = time()
	local var981
	if time_result1_10 < (tbl_16_upvr._actionCooldowns.ResetGrenade or 0) then
		var981 = false
	else
		tbl_16_upvr._actionCooldowns.ResetGrenade = time_result1_10 + 1
		var981 = true
	end
	if not var981 then
	else
		var981 = tbl_16_upvr.States.GrenadeReady
		if not var981 then return end
		var981 = print
		var981("Resetting grenade pin")
		var981 = tbl_16_upvr.States
		var981.GrenadeBusy = true
		var981 = tbl_16_upvr.States
		var981.GrenadeReady = false
		var981 = {}
		var981.PullRing = tbl_16_upvr.Assets.GunModel:FindFirstChild("PullRing")
		var981.SafetyPin = tbl_16_upvr.Assets.GunModel:FindFirstChild("SafetyPin")
		for _, v_41 in pairs(var981) do
			if v_41 and v_41:IsA("BasePart") then
				v_41.Transparency = 0
			end
		end
		if tbl_16_upvr.AnimationsTable.ThrowPre then
			tbl_16_upvr.AnimationsTable.ThrowPre:Stop()
		end
		local NormThrowUnLoad = tbl_16_upvr.AnimationsTable.NormThrowUnLoad
		NormThrowUnLoad:Play()
		NormThrowUnLoad.Stopped:Wait()
		tbl_16_upvr.States.IsHoldingGrenade = false
		tbl_16_upvr.States.GrenadeBusy = false
		tbl_16_upvr.LocalUtilities.BackPackSwitch(true, tbl_6_upvr)
		print("Grenade reset complete")
	end
end
local function _() -- Line 4869, Named "HandleGrenadeReload"
	--[[ Upvalues[2]:
		[1]: tbl_16_upvr (readonly)
		[2]: ResetGrenade_upvr (readonly)
	]]
	if tbl_16_upvr.Assets.SettingsGun.Grenade and tbl_16_upvr.States.IsHoldingGrenade then
		ResetGrenade_upvr()
		return true
	end
	return false
end
local function Grenade_upvr(arg1) -- Line 4877, Named "Grenade"
	--[[ Upvalues[5]:
		[1]: tbl_16_upvr (readonly)
		[2]: SetAnimationSound_upvr (readonly)
		[3]: tbl_6_upvr (readonly)
		[4]: SetProjectorSightVisible_upvr (readonly)
		[5]: GrenadeBang_upvr (readonly)
	]]
	-- KONSTANTERROR: [0] 1. Error Block 1 start (CF ANALYSIS FAILED)
	-- KONSTANTERROR: [0] 1. Error Block 1 end (CF ANALYSIS FAILED)
	-- KONSTANTERROR: [4] 4. Error Block 2 start (CF ANALYSIS FAILED)
	do
		return
	end
	-- KONSTANTERROR: [4] 4. Error Block 2 end (CF ANALYSIS FAILED)
	-- KONSTANTERROR: [5] 5. Error Block 3 start (CF ANALYSIS FAILED)
	local _ = {
		PullRing = tbl_16_upvr.Assets.GunModel:FindFirstChild("PullRing");
		SafetyPin = tbl_16_upvr.Assets.GunModel:FindFirstChild("SafetyPin");
	}
	local NormThrowStart_upvr = tbl_16_upvr.AnimationsTable.NormThrowStart
	local NormThrow_upvr = tbl_16_upvr.AnimationsTable.NormThrow
	local function _() -- Line 4888, Named "StopThrowAnimations"
		--[[ Upvalues[2]:
			[1]: NormThrowStart_upvr (readonly)
			[2]: NormThrow_upvr (readonly)
		]]
		if NormThrowStart_upvr then
			NormThrowStart_upvr:Stop()
		end
		if NormThrow_upvr then
			NormThrow_upvr:Stop()
		end
	end
	local function ResetGrenadeParts_upvr() -- Line 4893, Named "ResetGrenadeParts"
		--[[ Upvalues[1]:
			[1]: tbl_16_upvr (copied, readonly)
		]]
		for _, v_27 in pairs({
			PullRing = tbl_16_upvr.Assets.GunModel:FindFirstChild("PullRing");
			Lever = tbl_16_upvr.Assets.GunModel:FindFirstChild("Lever");
			SafetyPin = tbl_16_upvr.Assets.GunModel:FindFirstChild("SafetyPin");
			Grenade = tbl_16_upvr.Assets.GunModel:FindFirstChild("Grenade");
		}) do
			if v_27 then
				if v_27:IsA("BasePart") then
					v_27.Transparency = 0
				end
			end
		end
	end
	local function PlayEquipAndIdle_upvr() -- Line 4907, Named "PlayEquipAndIdle"
		--[[ Upvalues[3]:
			[1]: tbl_16_upvr (copied, readonly)
			[2]: ResetGrenadeParts_upvr (readonly)
			[3]: SetAnimationSound_upvr (copied, readonly)
		]]
		-- KONSTANTERROR: [0] 1. Error Block 1 start (CF ANALYSIS FAILED)
		-- KONSTANTERROR: [0] 1. Error Block 1 end (CF ANALYSIS FAILED)
		-- KONSTANTERROR: [4] 4. Error Block 25 start (CF ANALYSIS FAILED)
		if tbl_16_upvr.AmmoValue.Value <= 0 then
			-- KONSTANTERROR: [12] 9. Error Block 22 start (CF ANALYSIS FAILED)
			if tbl_16_upvr.currentTool then
				if tbl_16_upvr.currentTool:IsA("Tool") then
					tbl_16_upvr.currentTool.Enabled = false
					tbl_16_upvr.currentTool:Destroy()
				end
			end
			do
				return
			end
			-- KONSTANTERROR: [12] 9. Error Block 22 end (CF ANALYSIS FAILED)
		end
		ResetGrenadeParts_upvr()
		tbl_16_upvr.equipping = true
		local Equip = tbl_16_upvr.AnimationsTable.Equip
		local Idle_upvr = tbl_16_upvr.AnimationsTable.Idle
		if Equip then
			Equip.Loop = false
			Equip:Play({
				snap = true;
			}, function(arg1_6, arg2) -- Line 4922
				--[[ Upvalues[1]:
					[1]: SetAnimationSound_upvr (copied, readonly)
				]]
				if arg1_6 == "Sound" then
					SetAnimationSound_upvr("Handle", arg2)
				end
			end)
			tbl_16_upvr.BobbleModule:Trigger(tbl_16_upvr.Settings.BobbleEquipTrigger)
			local var1000_upvw
			var1000_upvw = Equip.Stopped:Connect(function() -- Line 4930
				--[[ Upvalues[2]:
					[1]: var1000_upvw (read and write)
					[2]: Idle_upvr (readonly)
				]]
				if var1000_upvw then
					var1000_upvw:Disconnect()
					var1000_upvw = nil
				end
				if Idle_upvr then
					Idle_upvr:Play({
						snap = true;
					})
				end
			end)
		elseif Idle_upvr and not Idle_upvr.IsPlaying then
			Idle_upvr:Play({
				snap = true;
			})
		end
		if Equip then
			Equip.Stopped:Wait()
		end
		tbl_16_upvr.equipping = false
		-- KONSTANTERROR: [4] 4. Error Block 25 end (CF ANALYSIS FAILED)
	end
	local function _() -- Line 4945, Named "CleanupAfterThrow"
		--[[ Upvalues[6]:
			[1]: NormThrowStart_upvr (readonly)
			[2]: NormThrow_upvr (readonly)
			[3]: PlayEquipAndIdle_upvr (readonly)
			[4]: tbl_16_upvr (copied, readonly)
			[5]: tbl_6_upvr (copied, readonly)
			[6]: SetProjectorSightVisible_upvr (copied, readonly)
		]]
		if NormThrowStart_upvr then
			NormThrowStart_upvr:Stop()
		end
		if NormThrow_upvr then
			NormThrow_upvr:Stop()
		end
		PlayEquipAndIdle_upvr()
		tbl_16_upvr.States.GrenadeBusy = false
		tbl_16_upvr.LocalUtilities.BackPackSwitch(true, tbl_6_upvr)
		if tbl_16_upvr.GrenadeDiedConn then
			tbl_16_upvr.GrenadeDiedConn:Disconnect()
			tbl_16_upvr.GrenadeDiedConn = nil
		end
		task.defer(function() -- Line 4955
			--[[ Upvalues[2]:
				[1]: tbl_16_upvr (copied, readonly)
				[2]: SetProjectorSightVisible_upvr (copied, readonly)
			]]
			if tbl_16_upvr.Aiming then
				SetProjectorSightVisible_upvr(true)
			end
		end)
	end
	-- KONSTANTERROR: [5] 5. Error Block 3 end (CF ANALYSIS FAILED)
end
local function AmmoBox_upvr() -- Line 5092, Named "AmmoBox"
	--[[ Upvalues[3]:
		[1]: tbl_16_upvr (readonly)
		[2]: SetAnimationSound_upvr (readonly)
		[3]: tbl_6_upvr (readonly)
	]]
	local time_result1_3 = time()
	local var1005
	if time_result1_3 < (tbl_16_upvr._actionCooldowns.AmmoBox or 0) then
		var1005 = false
	else
		tbl_16_upvr._actionCooldowns.AmmoBox = time_result1_3 + 3
		var1005 = true
	end
	if not var1005 then
	else
		var1005 = tbl_16_upvr.humanoid
		if not var1005 then return end
		var1005 = {}
		var1005.Anything1 = tbl_16_upvr.Assets.GunModel:FindFirstChild("Cube.001_Material_0")
		var1005.Anything2 = tbl_16_upvr.Assets.GunModel:FindFirstChild("Cube.002_Material_0")
		var1005.Anything3 = tbl_16_upvr.Assets.GunModel:FindFirstChild("Cube.003_Material_0")
		local Throw_upvr = tbl_16_upvr.AnimationsTable.Throw
		if Throw_upvr then
			Throw_upvr:Play({
				snap = false;
			}, function(arg1, arg2) -- Line 5104
				--[[ Upvalues[3]:
					[1]: SetAnimationSound_upvr (copied, readonly)
					[2]: Throw_upvr (readonly)
					[3]: tbl_16_upvr (copied, readonly)
				]]
				-- KONSTANTERROR: [0] 1. Error Block 1 start (CF ANALYSIS FAILED)
				-- KONSTANTERROR: [0] 1. Error Block 1 end (CF ANALYSIS FAILED)
				-- KONSTANTERROR: [2] 2. Error Block 2 start (CF ANALYSIS FAILED)
				SetAnimationSound_upvr("Handle", arg2)
				-- KONSTANTERROR: [2] 2. Error Block 2 end (CF ANALYSIS FAILED)
				-- KONSTANTERROR: [6] 6. Error Block 3 start (CF ANALYSIS FAILED)
				-- KONSTANTERROR: [6] 6. Error Block 3 end (CF ANALYSIS FAILED)
			end)
			tbl_16_upvr.BobbleModule:Trigger(tbl_16_upvr.Settings.BobbleChangeFiremodeTrigger)
			tbl_16_upvr.LocalUtilities.BackPackSwitch(false, tbl_6_upvr)
			Throw_upvr.Stopped:Wait()
			tbl_16_upvr.LocalUtilities.BackPackSwitch(true, tbl_6_upvr)
		end
	end
end
local var1009_upvw = false
function MagCheck() -- Line 5146
	--[[ Upvalues[2]:
		[1]: tbl_16_upvr (readonly)
		[2]: var1009_upvw (read and write)
	]]
	pcall(function() -- Line 5147
		--[[ Upvalues[2]:
			[1]: tbl_16_upvr (copied, readonly)
			[2]: var1009_upvw (copied, read and write)
		]]
		if tbl_16_upvr.Aiming then
		elseif tbl_16_upvr.AnimationsTable.MagOut then
			if tbl_16_upvr.AnimationsTable.MagIn then
				if var1009_upvw == false then
					var1009_upvw = true
					spawn(function() -- Line 5158
						task.wait(2)
					end)
					return
				end
				var1009_upvw = false
			end
		end
	end)
end
function Bandage(arg1) -- Line 5171
	--[[ Upvalues[1]:
		[1]: tbl_16_upvr (readonly)
	]]
	-- KONSTANTERROR: [0] 1. Error Block 22 start (CF ANALYSIS FAILED)
	local time_result1_2 = time()
	local var1013
	if time_result1_2 < (tbl_16_upvr._actionCooldowns.Bandage or 0) then
		var1013 = false
	else
		tbl_16_upvr._actionCooldowns.Bandage = time_result1_2 + 3
		var1013 = true
	end
	-- KONSTANTERROR: [0] 1. Error Block 22 end (CF ANALYSIS FAILED)
	-- KONSTANTERROR: [21] 16. Error Block 6 start (CF ANALYSIS FAILED)
	do
		return
	end
	-- KONSTANTERROR: [21] 16. Error Block 6 end (CF ANALYSIS FAILED)
	-- KONSTANTERROR: [22] 17. Error Block 7 start (CF ANALYSIS FAILED)
	var1013 = tbl_16_upvr.Character:GetAttribute("Bandages")
	-- KONSTANTERROR: [22] 17. Error Block 7 end (CF ANALYSIS FAILED)
end
tbl_16_upvr.Framework.Remotes.Ping.OnClientEvent:Connect(function(arg1) -- Line 5188
	--[[ Upvalues[1]:
		[1]: tbl_16_upvr (readonly)
	]]
	local Part = Instance.new("Part")
	Part.Size = Vector3.new(0.00999, 0.00999, 0.00999)
	Part.Anchored = true
	Part.CanCollide = false
	Part.Transparency = 1
	Part.Position = arg1
	Part.Parent = workspace
	game:GetService("Debris"):AddItem(Part, 4)
	local clone_3 = tbl_16_upvr.Framework.Essentials.Ping:Clone()
	clone_3.Parent = Part
	clone_3.Adornee = Part
	game:GetService("TweenService"):Create(clone_3.ImageLabel, TweenInfo.new(0.5, Enum.EasingStyle.Quart), {
		Position = UDim2.new(0, 0, 0, 0);
		ImageTransparency = 0;
	}):Play()
	script.Ping:Play()
end)
local function NVG_upvr(arg1) -- Line 5203, Named "NVG"
	--[[ Upvalues[2]:
		[1]: tbl_6_upvr (readonly)
		[2]: tbl_16_upvr (readonly)
	]]
	-- KONSTANTERROR: [0] 1. Error Block 1 start (CF ANALYSIS FAILED)
	-- KONSTANTERROR: [0] 1. Error Block 1 end (CF ANALYSIS FAILED)
	-- KONSTANTERROR: [4] 4. Error Block 2 start (CF ANALYSIS FAILED)
	tbl_6_upvr.Lighting = game:GetService("Lighting")
	-- KONSTANTERROR: [4] 4. Error Block 2 end (CF ANALYSIS FAILED)
	-- KONSTANTERROR: [13] 10. Error Block 3 start (CF ANALYSIS FAILED)
	-- KONSTANTERROR: [13] 10. Error Block 3 end (CF ANALYSIS FAILED)
end
local var1018_upvw = false
local function HandleInputBegan_upvr(arg1, arg2) -- Line 5264, Named "HandleInputBegan"
	--[[ Upvalues[25]:
		[1]: tbl_6_upvr (readonly)
		[2]: var1018_upvw (read and write)
		[3]: module_5_upvr (readonly)
		[4]: tbl_16_upvr (readonly)
		[5]: time_upvr (readonly)
		[6]: SetAnimationSound_upvr (readonly)
		[7]: EjectShellNow_upvr (readonly)
		[8]: DryFire_upvr (readonly)
		[9]: Grenade_upvr (readonly)
		[10]: AmmoBox_upvr (readonly)
		[11]: tbl_5_upvr (readonly)
		[12]: TryFireOnce_upvr (readonly)
		[13]: FireLoop_Auto_upvr (readonly)
		[14]: spawnBurstLoop_upvr (readonly)
		[15]: var777_upvw (read and write)
		[16]: var776_upvw (read and write)
		[17]: UpdateKeybindVisibility_upvr (readonly)
		[18]: ResetGrenade_upvr (readonly)
		[19]: Reload_upvr (readonly)
		[20]: totalmodes_upvr (readonly)
		[21]: ChangeAim_upvr (readonly)
		[22]: SwitchFireMode_upvr (readonly)
		[23]: getFlashlightToggles_upvr (readonly)
		[24]: NVG_upvr (readonly)
		[25]: SetSuppressorVisibility_upvr (readonly)
	]]
	-- KONSTANTERROR: [0] 1. Error Block 1 start (CF ANALYSIS FAILED)
	-- KONSTANTERROR: [0] 1. Error Block 1 end (CF ANALYSIS FAILED)
	-- KONSTANTERROR: [2] 2. Error Block 495 start (CF ANALYSIS FAILED)
	local Hit_2 = tbl_6_upvr.Players.LocalPlayer:GetMouse().Hit
	if Hit_2 then
		if var1018_upvw == false then
			local Position_upvr = Hit_2.Position
			if 1 <= (Position_upvr - workspace.Camera.CFrame.Position).Magnitude then
				local any_GetPlayerTeam_result1_7 = module_5_upvr:GetPlayerTeam(tbl_6_upvr.Players.LocalPlayer)
				for _, v_28 in pairs(tbl_6_upvr.Players:GetPlayers()) do
					local any_GetPlayerTeam_result1_4 = module_5_upvr:GetPlayerTeam(v_28)
					if any_GetPlayerTeam_result1_7 then
						if any_GetPlayerTeam_result1_4 then
							if any_GetPlayerTeam_result1_7.Name == any_GetPlayerTeam_result1_4.Name then
								table.insert({}, v_28)
							end
						end
					end
				end
				local tbl_15_upvr = {}
				task.spawn(function() -- Line 5284
					--[[ Upvalues[4]:
						[1]: var1018_upvw (copied, read and write)
						[2]: tbl_16_upvr (copied, readonly)
						[3]: tbl_15_upvr (readonly)
						[4]: Position_upvr (readonly)
					]]
					var1018_upvw = true
					tbl_16_upvr.Framework.Remotes.Ping:FireServer(tbl_15_upvr, Position_upvr)
					task.wait(2)
					var1018_upvw = false
				end)
			end
		end
	end
	do
		return
	end
	-- KONSTANTERROR: [2] 2. Error Block 495 end (CF ANALYSIS FAILED)
end
local function HandleInputEnded_upvr(arg1) -- Line 5670, Named "HandleInputEnded"
	--[[ Upvalues[3]:
		[1]: tbl_16_upvr (readonly)
		[2]: Grenade_upvr (readonly)
		[3]: FadeOutAndDestroy_upvr (readonly)
	]]
	-- KONSTANTERROR: [0] 1. Error Block 1 start (CF ANALYSIS FAILED)
	-- KONSTANTERROR: [0] 1. Error Block 1 end (CF ANALYSIS FAILED)
	-- KONSTANTERROR: [4] 4. Error Block 2 start (CF ANALYSIS FAILED)
	do
		return
	end
	-- KONSTANTERROR: [4] 4. Error Block 2 end (CF ANALYSIS FAILED)
	-- KONSTANTERROR: [5] 5. Error Block 3 start (CF ANALYSIS FAILED)
	-- KONSTANTERROR: [5] 5. Error Block 3 end (CF ANALYSIS FAILED)
end
tbl_16_upvr.Mouse = tbl_16_upvr.LocalPlayer:GetMouse()
tbl_16_upvr.Mouse.WheelBackward:Connect(function() -- Line 5702
	--[[ Upvalues[1]:
		[1]: tbl_16_upvr (readonly)
	]]
	local var1044
	if var1044 then
		var1044 = tbl_16_upvr.equipped
		if not var1044 then return end
		local time_result1_9 = time()
		if time_result1_9 < (tbl_16_upvr._actionCooldowns.Stance or 0) then
			var1044 = false
		else
			tbl_16_upvr._actionCooldowns.Stance = time_result1_9 + 0.15
			var1044 = true
		end
		if var1044 then
			var1044 = tbl_16_upvr.Aiming
			if var1044 then return end
			var1044 = tbl_16_upvr.States.StanceViewmodel
			if not var1044 then
				var1044 = tbl_16_upvr.States
				var1044.StanceViewmodel = 0
			end
			var1044 = tbl_16_upvr.States
			var1044.StanceViewmodel += -1
			var1044 = tbl_16_upvr.States
			var1044.StanceViewmodel = math.clamp(tbl_16_upvr.States.StanceViewmodel, -2, 1)
			var1044 = tbl_16_upvr.BobbleModule:Trigger
			var1044(tbl_16_upvr.Settings.BobbleEquipTrigger)
		end
	end
end)
tbl_16_upvr.Mouse.WheelForward:Connect(function() -- Line 5706
	--[[ Upvalues[1]:
		[1]: tbl_16_upvr (readonly)
	]]
	local var1047
	if var1047 then
		var1047 = tbl_16_upvr.equipped
		if not var1047 then return end
		local time_result1_8 = time()
		if time_result1_8 < (tbl_16_upvr._actionCooldowns.Stance or 0) then
			var1047 = false
		else
			tbl_16_upvr._actionCooldowns.Stance = time_result1_8 + 0.15
			var1047 = true
		end
		if var1047 then
			var1047 = tbl_16_upvr.Aiming
			if var1047 then return end
			var1047 = tbl_16_upvr.States.StanceViewmodel
			if not var1047 then
				var1047 = tbl_16_upvr.States
				var1047.StanceViewmodel = 0
			end
			var1047 = tbl_16_upvr.States
			var1047.StanceViewmodel += 1
			var1047 = tbl_16_upvr.States
			var1047.StanceViewmodel = math.clamp(tbl_16_upvr.States.StanceViewmodel, -2, 1)
			var1047 = tbl_16_upvr.BobbleModule:Trigger
			var1047(tbl_16_upvr.Settings.BobbleEquipTrigger)
		end
	end
end)
function tbl_16_upvr.CAS_ActionHandler(arg1, arg2, arg3) -- Line 5710
	--[[ Upvalues[2]:
		[1]: HandleInputBegan_upvr (readonly)
		[2]: HandleInputEnded_upvr (readonly)
	]]
	if arg2 == Enum.UserInputState.Begin then
		HandleInputBegan_upvr(arg1)
	elseif arg2 == Enum.UserInputState.End then
		HandleInputEnded_upvr(arg1)
	end
end
local function ShowHitMarker_upvr(arg1, arg2) -- Line 5719, Named "ShowHitMarker"
	--[[ Upvalues[2]:
		[1]: tbl_16_upvr (readonly)
		[2]: tbl_6_upvr (readonly)
	]]
	-- KONSTANTWARNING: Variable analysis failed. Output will have some incorrect variable assignments
	local HitMarker_upvr = tbl_16_upvr.GunHud:FindFirstChild("HitMarker")
	local var1051
	if not HitMarker_upvr then
	else
		if arg1 then
			var1051 = 50
			HitMarker_upvr.ImageColor3 = Color3.fromRGB(255, var1051, 50)
			var1051 = 30
			HitMarker_upvr.Size = UDim2.new(0, var1051, 0, 30)
		else
			var1051 = 255
			HitMarker_upvr.ImageColor3 = Color3.fromRGB(255, var1051, 255)
			var1051 = 20
			HitMarker_upvr.Size = UDim2.new(0, var1051, 0, 20)
		end
		HitMarker_upvr.ImageTransparency = 0
		HitMarker_upvr.Visible = true
		local any_Create_result1_4 = tbl_6_upvr.Tween:Create(HitMarker_upvr, TweenInfo.new(0.15, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
			ImageTransparency = 1;
			Size = UDim2.new(0, 40, 0, 40);
		})
		any_Create_result1_4:Play()
		any_Create_result1_4.Completed:Connect(function() -- Line 5743
			--[[ Upvalues[1]:
				[1]: HitMarker_upvr (readonly)
			]]
			HitMarker_upvr.Visible = false
		end)
		if tbl_6_upvr.UserInputService.GamepadEnabled then
			if arg1 then
			else
			end
			local Gamepad1_upvr_2 = Enum.UserInputType.Gamepad1
			local const_number_upvr = 0.5
			pcall(function() -- Line 5750
				--[[ Upvalues[3]:
					[1]: tbl_6_upvr (copied, readonly)
					[2]: Gamepad1_upvr_2 (readonly)
					[3]: const_number_upvr (readonly)
				]]
				tbl_6_upvr.HapticService:SetMotor(Gamepad1_upvr_2, Enum.VibrationMotor.Small, const_number_upvr)
				task.delay(0.08, function() -- Line 5752
					--[[ Upvalues[2]:
						[1]: tbl_6_upvr (copied, readonly)
						[2]: Gamepad1_upvr_2 (copied, readonly)
					]]
					tbl_6_upvr.HapticService:SetMotor(Gamepad1_upvr_2, Enum.VibrationMotor.Small, 0)
				end)
			end)
		end
	end
end
tbl_16_upvr.Bridges.LoadData:Connect(function(arg1) -- Line 5821
	--[[ Upvalues[1]:
		[1]: tbl_16_upvr (readonly)
	]]
	require(tbl_16_upvr.Framework.Modules.AttachmentsHandler):LoadAttachments(arg1.GunName, arg1.data)
end)
tbl_16_upvr.Bridges.LoadGuns:Connect(function() -- Line 5825
	--[[ Upvalues[1]:
		[1]: tbl_16_upvr (readonly)
	]]
	for _, v_29_upvr in pairs(tbl_16_upvr.Client:GetChildren()) do
		if v_29_upvr:IsA("Model") then
			if v_29_upvr:FindFirstChild("Attachments") then
				for _, v_30_upvr in pairs(v_29_upvr.Attachments:GetChildren()) do
					if v_30_upvr:FindFirstChild("Attachment") then
						if v_30_upvr:FindFirstChild("Point") and v_30_upvr.Attachment.Value ~= "" and not v_30_upvr:FindFirstChildOfClass("Model") then
							local var1090_upvr = v_30_upvr.Name..'s'
							local Value_5 = v_30_upvr.Attachment.Value
							if tbl_16_upvr.Framework.Attachments:FindFirstChild(var1090_upvr) then
								local SOME_8_upvr = tbl_16_upvr.Framework.Attachments:FindFirstChild(var1090_upvr):FindFirstChild(Value_5)
								if SOME_8_upvr then
									local AttachmentsHandler_upvr = require(tbl_16_upvr.Framework.Modules.AttachmentsHandler)
									local pcall_result1_4, pcall_result2_4 = pcall(function() -- Line 5843
										--[[ Upvalues[5]:
											[1]: AttachmentsHandler_upvr (readonly)
											[2]: v_29_upvr (readonly)
											[3]: v_30_upvr (readonly)
											[4]: SOME_8_upvr (readonly)
											[5]: var1090_upvr (readonly)
										]]
										AttachmentsHandler_upvr:ClearSameAttachments(v_29_upvr, v_30_upvr.Name)
										AttachmentsHandler_upvr:SetAttachment(v_29_upvr, SOME_8_upvr, var1090_upvr)
									end)
									if not pcall_result1_4 then
										warn("[LoadGuns] Failed to apply attachment:", pcall_result2_4)
									else
										print("[LoadGuns] Successfully applied attachment")
									end
								else
									warn("[LoadGuns] Attachment model not found:", Value_5, "in", var1090_upvr)
								end
							else
								SOME_8_upvr = warn
								SOME_8_upvr("[LoadGuns] Attachment type folder not found:", var1090_upvr)
							end
						end
					end
				end
				for i_34, v_31 in pairs(v_29_upvr:GetDescendants()) do
					SOME_8_upvr = "BasePart"
					var1090_upvr = v_31:IsA(SOME_8_upvr)
					if var1090_upvr then
						var1090_upvr = false
						v_31.Anchored = var1090_upvr
					end
				end
				local pcall_result1_7, pcall_result2 = pcall(function() -- Line 5868
					--[[ Upvalues[2]:
						[1]: AttachmentsHandler_upvr (readonly)
						[2]: v_29_upvr (readonly)
					]]
					AttachmentsHandler_upvr:HandleSuppressorAnimations(v_29_upvr)
					AttachmentsHandler_upvr:SortAimParts(v_29_upvr)
					AttachmentsHandler_upvr:ParentParts(v_29_upvr)
					AttachmentsHandler_upvr:HolsterModel(v_29_upvr)
				end)
				if not pcall_result1_7 then
					i_34 = "[LoadGuns] Failed to finalize gun:"
					v_31 = pcall_result2
					warn(i_34, v_31)
				end
			end
		end
	end
end)
tbl_16_upvr.Bridges.MessageBridge:Connect(function(arg1) -- Line 5882
	--[[ Upvalues[2]:
		[1]: tbl_16_upvr (readonly)
		[2]: tbl_6_upvr (readonly)
	]]
	local Character_4 = arg1.Character
	local var1105
	if var1105 then
		var1105 = Character_4:FindFirstChild("Head")
	end
	if Character_4 then
		if var1105 then
			local Sound_3 = Instance.new("Sound")
			Sound_3.RollOffMode = Enum.RollOffMode.Linear
			Sound_3.RollOffMaxDistance = 200
			Sound_3.RollOffMinDistance = 50
			Sound_3.SoundId = arg1.DialogeSoundID
			Sound_3.Volume = 1.5
			local EqualizerSoundEffect_2 = Instance.new("EqualizerSoundEffect", Sound_3)
			EqualizerSoundEffect_2.HighGain = -80
			EqualizerSoundEffect_2.LowGain = -80
			EqualizerSoundEffect_2.MidGain = 10
			Sound_3.Parent = var1105
			Sound_3:Play()
			game:GetService("Debris"):AddItem(Sound_3, 10)
			if arg1.Player == tbl_16_upvr.LocalPlayer then return end
			local Highlight_upvr = Instance.new("Highlight")
			Highlight_upvr.Name = "Game"
			Highlight_upvr.FillColor = Color3.fromRGB(173, 216, 230)
			Highlight_upvr.OutlineColor = Color3.fromRGB(173, 216, 230)
			Highlight_upvr.FillTransparency = 0.7
			Highlight_upvr.OutlineTransparency = 0
			Highlight_upvr.Parent = Character_4
			task.delay(5, function() -- Line 5908
				--[[ Upvalues[2]:
					[1]: tbl_6_upvr (copied, readonly)
					[2]: Highlight_upvr (readonly)
				]]
				local any_Create_result1_2 = tbl_6_upvr.Tween:Create(Highlight_upvr, TweenInfo.new(1, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
					FillTransparency = 1;
					OutlineTransparency = 1;
				})
				any_Create_result1_2:Play()
				any_Create_result1_2.Completed:Wait()
				Highlight_upvr:Destroy()
			end)
		end
	end
end)
local tbl_17_upvr = {}
local function CreateHolster_upvr(arg1, arg2, arg3, arg4, arg5) -- Line 5923, Named "CreateHolster"
	--[[ Upvalues[3]:
		[1]: tbl_17_upvr (readonly)
		[2]: tbl_16_upvr (readonly)
		[3]: tbl_6_upvr (readonly)
	]]
	-- KONSTANTERROR: [0] 1. Error Block 1 start (CF ANALYSIS FAILED)
	-- KONSTANTERROR: [0] 1. Error Block 1 end (CF ANALYSIS FAILED)
	-- KONSTANTERROR: [1] 2. Error Block 84 start (CF ANALYSIS FAILED)
	if not arg2 then
		-- KONSTANTERROR: [2] 3. Error Block 3 start (CF ANALYSIS FAILED)
		do
			return
		end
		-- KONSTANTERROR: [2] 3. Error Block 3 end (CF ANALYSIS FAILED)
	end
	-- KONSTANTERROR: [1] 2. Error Block 84 end (CF ANALYSIS FAILED)
end
local function RemoveHolster_upvr(arg1, arg2) -- Line 6143, Named "RemoveHolster"
	--[[ Upvalues[1]:
		[1]: tbl_17_upvr (readonly)
	]]
	if not arg1 then
	else
		local Name_2 = arg1.Name
		if not Name_2 or Name_2 == "" then return end
		if tbl_17_upvr[Name_2] then
			tbl_17_upvr[Name_2]:Disconnect()
			tbl_17_upvr[Name_2] = nil
		end
		if not arg2 then return end
		local HolsterFolder = arg2:FindFirstChild("HolsterFolder")
		if not HolsterFolder then return end
		local SOME_4 = HolsterFolder:FindFirstChild(Name_2.."_Holster")
		if SOME_4 then
			SOME_4:Destroy()
		end
	end
end
local function _(arg1) -- Line 6165, Named "CleanupAllHolsters"
	--[[ Upvalues[1]:
		[1]: tbl_17_upvr (readonly)
	]]
	if not arg1 then
	else
		local HolsterFolder_2 = arg1:FindFirstChild("HolsterFolder")
		if HolsterFolder_2 then
			for _, v_42 in ipairs(HolsterFolder_2:GetChildren()) do
				if v_42:IsA("Model") then
					local any_gsub_result1 = v_42.Name:gsub("_Holster$", "")
					if tbl_17_upvr[any_gsub_result1] then
						tbl_17_upvr[any_gsub_result1]:Disconnect()
						tbl_17_upvr[any_gsub_result1] = nil
					end
				end
			end
			HolsterFolder_2:Destroy()
		end
	end
end
local tbl_24_upvw = {}
local function cleanupEffects_upvr() -- Line 6187, Named "cleanupEffects"
	--[[ Upvalues[1]:
		[1]: tbl_24_upvw (read and write)
	]]
	for _, v_32 in ipairs(tbl_24_upvw) do
		if v_32 and v_32.Parent then
			v_32:Destroy()
		end
	end
	tbl_24_upvw = {}
end
local function _() -- Line 6196, Named "getOrCreateBlur"
	local ExplosionBlur = game:GetService("Lighting"):FindFirstChild("ExplosionBlur")
	if ExplosionBlur then
		return ExplosionBlur
	end
	local BlurEffect = Instance.new("BlurEffect")
	BlurEffect.Name = "ExplosionBlur"
	BlurEffect.Size = 0
	BlurEffect.Parent = game:GetService("Lighting")
	return BlurEffect
end
local var1131_upvw = false
local var1132_upvw
local function playExplosionEffect_upvr(arg1, arg2) -- Line 6209, Named "playExplosionEffect"
	--[[ Upvalues[5]:
		[1]: var1131_upvw (read and write)
		[2]: cleanupEffects_upvr (readonly)
		[3]: tbl_24_upvw (read and write)
		[4]: var1132_upvw (read and write)
		[5]: tbl_6_upvr (readonly)
	]]
	if var1131_upvw then
		cleanupEffects_upvr()
	end
	var1131_upvw = true
	local clamped_7 = math.clamp(1 - arg2 / 100, 0.1, 1)
	local Sound_2 = Instance.new("Sound")
	Sound_2.Name = "RingingSound"
	Sound_2.SoundId = "rbxassetid://9069161602"
	Sound_2.Volume = clamped_7 * 0.3
	Sound_2.Looped = true
	local var1135 = arg1
	if not var1135 then
		var1135 = game:GetService("SoundService")
	end
	Sound_2.Parent = var1135
	Sound_2:Play()
	table.insert(tbl_24_upvw, Sound_2)
	local EqualizerSoundEffect = Instance.new("EqualizerSoundEffect")
	EqualizerSoundEffect.HighGain = clamped_7 * -20
	EqualizerSoundEffect.MidGain = clamped_7 * -10
	EqualizerSoundEffect.LowGain = clamped_7 * 5
	local var1137 = arg1
	if not var1137 then
		var1137 = game:GetService("SoundService")
	end
	EqualizerSoundEffect.Parent = var1137
	table.insert(tbl_24_upvw, EqualizerSoundEffect)
	local PitchShiftSoundEffect = Instance.new("PitchShiftSoundEffect")
	PitchShiftSoundEffect.Octave = 1 - clamped_7 * 0.2
	local var1139 = arg1
	if not var1139 then
		var1139 = game:GetService("SoundService")
	end
	PitchShiftSoundEffect.Parent = var1139
	var1139 = table.insert
	local var1140 = var1139
	var1140(tbl_24_upvw, PitchShiftSoundEffect)
	local ExplosionBlur_2 = game:GetService("Lighting"):FindFirstChild("ExplosionBlur")
	if ExplosionBlur_2 then
		var1140 = ExplosionBlur_2
	else
		local BlurEffect_2 = Instance.new("BlurEffect")
		BlurEffect_2.Name = "ExplosionBlur"
		BlurEffect_2.Size = 0
		BlurEffect_2.Parent = game:GetService("Lighting")
		var1140 = BlurEffect_2
	end
	var1132_upvw = var1140
	tbl_6_upvr.Tween:Create(var1132_upvw, TweenInfo.new(0.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
		Size = clamped_7 * 25;
	}):Play()
	local any_Create_result1_6_upvr = tbl_6_upvr.Tween:Create(var1132_upvw, TweenInfo.new(5, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
		Size = 0;
	})
	any_Create_result1_6_upvr.Completed:Connect(function() -- Line 6253
		--[[ Upvalues[1]:
			[1]: var1132_upvw (copied, read and write)
		]]
		if var1132_upvw then
			var1132_upvw.Size = 0
		end
	end)
	task.delay(0.3, function() -- Line 6259
		--[[ Upvalues[1]:
			[1]: any_Create_result1_6_upvr (readonly)
		]]
		any_Create_result1_6_upvr:Play()
	end)
	tbl_6_upvr.Tween:Create(Sound_2, TweenInfo.new(4, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
		Volume = 0;
	}):Play()
	tbl_6_upvr.Tween:Create(EqualizerSoundEffect, TweenInfo.new(5, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
		HighGain = 0;
		MidGain = 0;
		LowGain = 0;
	}):Play()
	tbl_6_upvr.Tween:Create(PitchShiftSoundEffect, TweenInfo.new(4, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
		Octave = 1;
	}):Play()
	task.delay(6, function() -- Line 6281
		--[[ Upvalues[2]:
			[1]: cleanupEffects_upvr (copied, readonly)
			[2]: var1131_upvw (copied, read and write)
		]]
		cleanupEffects_upvr()
		var1131_upvw = false
	end)
end
tbl_16_upvr.Framework.Remotes.GetEffect.OnClientEvent:Connect(function(arg1) -- Line 6287
	--[[ Upvalues[2]:
		[1]: playExplosionEffect_upvr (readonly)
		[2]: tbl_16_upvr (readonly)
	]]
	playExplosionEffect_upvr(tbl_16_upvr.BasicSound, arg1)
end)
tbl_16_upvr.Framework.Remotes.NotifyKill.OnClientEvent:Connect(function(arg1, arg2) -- Line 6291
	--[[ Upvalues[2]:
		[1]: tbl_16_upvr (readonly)
		[2]: tbl_6_upvr (readonly)
	]]
	local KillUi_2 = tbl_16_upvr.GunHud:FindFirstChild("KillUi")
	if KillUi_2 then
		local Holder_upvr_2 = KillUi_2:FindFirstChild("Holder")
		if Holder_upvr_2 then
			task.spawn(function() -- Line 6296
				--[[ Upvalues[4]:
					[1]: Holder_upvr_2 (readonly)
					[2]: arg1 (readonly)
					[3]: tbl_6_upvr (copied, readonly)
					[4]: arg2 (readonly)
				]]
				local clone_6 = Holder_upvr_2:FindFirstChild("Template"):Clone()
				local Name_3 = arg1.Name
				clone_6.Name = Name_3
				if arg1.Name == tbl_6_upvr.Players.LocalPlayer.Name then
					Name_3 = "You Eliminated Yourself"
				else
					Name_3 = `You Eliminated {arg1.DisplayName}`
				end
				clone_6.header.Text = Name_3
				clone_6.Parent = Holder_upvr_2
				clone_6.Visible = true
				if arg2 then
					clone_6.HeadShot.Visible = arg2
				end
				task.wait(6.5)
				tbl_6_upvr.Tween:Create(clone_6, TweenInfo.new(0.5), {
					Size = UDim2.new(1, 0, 0, 0);
				}):Play()
				game:GetService("Debris"):AddItem(clone_6, 0.5)
			end)
		end
	end
end)
tbl_16_upvr.Bridges.HolsterBridge:Connect(function(arg1) -- Line 6314
	--[[ Upvalues[2]:
		[1]: RemoveHolster_upvr (readonly)
		[2]: CreateHolster_upvr (readonly)
	]]
	-- KONSTANTERROR: [0] 1. Error Block 1 start (CF ANALYSIS FAILED)
	-- KONSTANTERROR: [0] 1. Error Block 1 end (CF ANALYSIS FAILED)
	-- KONSTANTERROR: [14] 10. Error Block 4 start (CF ANALYSIS FAILED)
	RemoveHolster_upvr(arg1.Tool, arg1.Character)
	do
		return
	end
	-- KONSTANTERROR: [14] 10. Error Block 4 end (CF ANALYSIS FAILED)
	-- KONSTANTERROR: [21] 15. Error Block 11 start (CF ANALYSIS FAILED)
	if arg1.Type == "Create" and arg1.Character then
		if arg1.Character:FindFirstChild("Head") then
			CreateHolster_upvr(arg1.Tool, arg1.Character, arg1.Part, arg1.HolsterCF, arg1.MoveAxis)
		end
	end
	-- KONSTANTERROR: [21] 15. Error Block 11 end (CF ANALYSIS FAILED)
end)
tbl_16_upvr.Bridges.ReplicateBullet:Connect(function(arg1) -- Line 6326
	--[[ Upvalues[2]:
		[1]: tbl_6_upvr (readonly)
		[2]: tbl_16_upvr (readonly)
	]]
	-- KONSTANTERROR: [0] 1. Error Block 1 start (CF ANALYSIS FAILED)
	-- KONSTANTERROR: [0] 1. Error Block 1 end (CF ANALYSIS FAILED)
	-- KONSTANTERROR: [7] 6. Error Block 2 start (CF ANALYSIS FAILED)
	do
		return
	end
	-- KONSTANTERROR: [7] 6. Error Block 2 end (CF ANALYSIS FAILED)
	-- KONSTANTERROR: [8] 7. Error Block 3 start (CF ANALYSIS FAILED)
	-- KONSTANTERROR: [8] 7. Error Block 3 end (CF ANALYSIS FAILED)
end)
local SUPPRESS_DIR_DECAY = tbl_16_upvr.SUPPRESS_DIR_DECAY
if not SUPPRESS_DIR_DECAY then
	SUPPRESS_DIR_DECAY = 1
end
tbl_16_upvr.SUPPRESS_DIR_DECAY = SUPPRESS_DIR_DECAY
SUPPRESS_DIR_DECAY = tbl_16_upvr.SUPPRESS_BLUR_MAX
local var1169 = SUPPRESS_DIR_DECAY
if not var1169 then
	var1169 = 12
end
tbl_16_upvr.SUPPRESS_BLUR_MAX = var1169
var1169 = tbl_16_upvr.SUPPRESS_VIGNETTE_MAX
local var1170 = var1169
if not var1170 then
	var1170 = 0.72
end
tbl_16_upvr.SUPPRESS_VIGNETTE_MAX = var1170
var1170 = tbl_16_upvr.SUPPRESS_FRIENDLY_MULT
local var1171 = var1170
if not var1171 then
	var1171 = 0
end
tbl_16_upvr.SUPPRESS_FRIENDLY_MULT = var1171
var1171 = tbl_16_upvr.SUPPRESS_SATURATION_MIN
local var1172 = var1171
if not var1172 then
	var1172 = -0.4
end
tbl_16_upvr.SUPPRESS_SATURATION_MIN = var1172
var1172 = tbl_16_upvr.SUPPRESS_BRIGHTNESS_DIM
local var1173 = var1172
if not var1173 then
	var1173 = -0.15
end
tbl_16_upvr.SUPPRESS_BRIGHTNESS_DIM = var1173
var1173 = tbl_16_upvr.SUPPRESS_CHROMATIC_MAX
local var1174 = var1173
if not var1174 then
	var1174 = 0.006
end
tbl_16_upvr.SUPPRESS_CHROMATIC_MAX = var1174
if not tbl_16_upvr.Suppression then
end
tbl_16_upvr.Suppression = {
	strength = 0;
	dir = Vector2.new();
	lastHitT = 0;
	loopConn = nil;
}
local function _getOrCreateColorCorrection_upvr() -- Line 6382, Named "_getOrCreateColorCorrection"
	--[[ Upvalues[1]:
		[1]: tbl_16_upvr (readonly)
	]]
	if tbl_16_upvr.Assets._suppressionCC then
		return tbl_16_upvr.Assets._suppressionCC
	end
	local ColorCorrectionEffect = Instance.new("ColorCorrectionEffect")
	ColorCorrectionEffect.Name = "SuppressionColorCorrection"
	ColorCorrectionEffect.Brightness = 0
	ColorCorrectionEffect.Contrast = 0
	ColorCorrectionEffect.Saturation = 0
	ColorCorrectionEffect.TintColor = Color3.new(1, 1, 1)
	ColorCorrectionEffect.Parent = tbl_16_upvr.Camera
	tbl_16_upvr.Assets._suppressionCC = ColorCorrectionEffect
	return ColorCorrectionEffect
end
;(function() -- Line 6397, Named "_initWhizzPool"
	--[[ Upvalues[2]:
		[1]: tbl_16_upvr (readonly)
		[2]: tbl_6_upvr (readonly)
	]]
	if tbl_16_upvr._whizzReady then
	else
		local WhizzPool = tbl_16_upvr.WhizzPool
		if not WhizzPool then
			WhizzPool = {}
		end
		tbl_16_upvr.WhizzPool = WhizzPool
		for i_48 = #tbl_16_upvr.WhizzPool + 1, tbl_16_upvr.WHIZZ_POOL_SIZE or 6 do
			local Sound = Instance.new("Sound")
			Sound.RollOffMode = Enum.RollOffMode.Linear
			Sound.RollOffMinDistance = 5
			Sound.RollOffMaxDistance = 5
			Sound.Volume = 0.6
			Sound.Parent = tbl_6_upvr.SoundService
			tbl_16_upvr.WhizzPool[i_48] = Sound
		end
		tbl_16_upvr._whizzIndex = 1
		tbl_16_upvr._whizzReady = true
		tbl_16_upvr.GlobalJanitor:Add(function() -- Line 6413
			--[[ Upvalues[1]:
				[1]: tbl_16_upvr (copied, readonly)
			]]
			for _, v_43_upvr in ipairs(tbl_16_upvr.WhizzPool) do
				if v_43_upvr then
					if v_43_upvr.Parent then
						pcall(function() -- Line 6416
							--[[ Upvalues[1]:
								[1]: v_43_upvr (readonly)
							]]
							v_43_upvr:Stop()
						end)
						v_43_upvr:Destroy()
					end
				end
			end
			table.clear(tbl_16_upvr.WhizzPool)
			tbl_16_upvr._whizzReady = false
		end, true)
	end
end)()
local function _playWhizz_upvr(arg1, arg2) -- Line 6426, Named "_playWhizz"
	--[[ Upvalues[1]:
		[1]: tbl_16_upvr (readonly)
	]]
	-- KONSTANTERROR: [0] 1. Error Block 1 start (CF ANALYSIS FAILED)
	-- KONSTANTERROR: [0] 1. Error Block 1 end (CF ANALYSIS FAILED)
	-- KONSTANTERROR: [4] 4. Error Block 10 start (CF ANALYSIS FAILED)
	if #tbl_16_upvr.WhizzPool == 0 then
		-- KONSTANTERROR: [10] 8. Error Block 3 start (CF ANALYSIS FAILED)
		do
			return
		end
		-- KONSTANTERROR: [10] 8. Error Block 3 end (CF ANALYSIS FAILED)
	end
	local var1188 = tbl_16_upvr._whizzIndex or 1
	local var1189 = tbl_16_upvr.WhizzPool[var1188]
	tbl_16_upvr._whizzIndex = var1188 % #tbl_16_upvr.WhizzPool + 1
	if not var1189 then
	else
		var1189.SoundId = arg1
		var1189.PlaybackSpeed = math.random(95, 110) * 0.01
		var1189.Volume = math.clamp(arg2 or 0.5, 0, 0.8)
		var1189:Play()
		-- KONSTANTERROR: [4] 4. Error Block 10 end (CF ANALYSIS FAILED)
	end
end
local function _updateUI_upvr() -- Line 6438, Named "_updateUI"
	--[[ Upvalues[2]:
		[1]: tbl_16_upvr (readonly)
		[2]: _getOrCreateColorCorrection_upvr (readonly)
	]]
	-- KONSTANTERROR: [0] 1. Error Block 1 start (CF ANALYSIS FAILED)
	local clamped_2 = math.clamp(tbl_16_upvr.Suppression.strength, 0, 1)
	-- KONSTANTERROR: [0] 1. Error Block 1 end (CF ANALYSIS FAILED)
	-- KONSTANTERROR: [15] 12. Error Block 20 start (CF ANALYSIS FAILED)
	local var1191 = 1 - clamped_2 * tbl_16_upvr.SUPPRESS_VIGNETTE_MAX
	if 0.5 < clamped_2 then
		var1191 = math.clamp(var1191 - (math.sin(tick() * (clamped_2 * 3 + 4))) * (clamped_2 * 0.08), 0, 1)
	end
	tbl_16_upvr.Supress.ImageTransparency = var1191
	if 0.6 < clamped_2 then
		local var1192 = (clamped_2 - 0.6) * 2.5
		tbl_16_upvr.Supress.ImageColor3 = Color3.new(1, 1 - var1192 * 0.3, 1 - var1192 * 0.3)
	else
		tbl_16_upvr.Supress.ImageColor3 = Color3.new(1, 1, 1)
	end
	-- KONSTANTERROR: [15] 12. Error Block 20 end (CF ANALYSIS FAILED)
end
local function _ensureLoop_upvr() -- Line 6476, Named "_ensureLoop"
	--[[ Upvalues[3]:
		[1]: tbl_16_upvr (readonly)
		[2]: tbl_6_upvr (readonly)
		[3]: _updateUI_upvr (readonly)
	]]
	if tbl_16_upvr.Suppression.loopConn then
	else
		local var1194_upvw = 0
		tbl_16_upvr.Suppression.loopConn = tbl_6_upvr.RunService.Heartbeat:Connect(function(arg1) -- Line 6481
			--[[ Upvalues[3]:
				[1]: var1194_upvw (read and write)
				[2]: tbl_16_upvr (copied, readonly)
				[3]: _updateUI_upvr (copied, readonly)
			]]
			var1194_upvw += arg1
			if var1194_upvw < 0.03333333333333333 then
			else
				local var1195 = var1194_upvw
				var1194_upvw = 0
				local Suppression = tbl_16_upvr.Suppression
				if Suppression.strength < 0.005 then
					if Suppression.dir.Magnitude < 0.005 then
						tbl_16_upvr.Suppression.loopConn:Disconnect()
						tbl_16_upvr.Suppression.loopConn = nil
						if tbl_16_upvr.Assets.SuppressionBlur then
							tbl_16_upvr.Assets.SuppressionBlur.Size = 0
						end
						if tbl_16_upvr.Assets._suppressionCC then
							tbl_16_upvr.Assets._suppressionCC.Saturation = 0
							tbl_16_upvr.Assets._suppressionCC.Brightness = 0
							tbl_16_upvr.Assets._suppressionCC.Contrast = 0
						end
						if tbl_16_upvr.Supress then
							tbl_16_upvr.Supress.ImageColor3 = Color3.new(1, 1, 1)
						end
						_updateUI_upvr()
						return
					end
				end
				local maximum = math.max(0, Suppression.strength - ((tbl_16_upvr.decayRate or 0.4) + 0.25 * Suppression.strength * (1 - Suppression.strength * 0.25)) * var1195)
				Suppression.dir *= math.clamp(1 - tbl_16_upvr.SUPPRESS_DIR_DECAY * var1195, 0, 1)
				Suppression.strength = maximum
				local clamped = math.clamp(maximum, 0, 1)
				if tbl_16_upvr.Assets.SuppressionBlur then
					local var1199 = clamped * tbl_16_upvr.SUPPRESS_BLUR_MAX
					if 0.5 < clamped then
						var1199 += math.sin(tick() * 6) * (clamped - 0.5) * 2
					end
					local Size = tbl_16_upvr.Assets.SuppressionBlur.Size
					tbl_16_upvr.Assets.SuppressionBlur.Size = Size + (var1199 - Size) * 0.12
				end
				_updateUI_upvr()
			end
		end)
		tbl_16_upvr.CharacterJanitor:Add(function() -- Line 6534
			--[[ Upvalues[1]:
				[1]: tbl_16_upvr (copied, readonly)
			]]
			if tbl_16_upvr.Suppression.loopConn then
				tbl_16_upvr.Suppression.loopConn:Disconnect()
				tbl_16_upvr.Suppression.loopConn = nil
			end
			tbl_16_upvr.Suppression.strength = 0
			tbl_16_upvr.Suppression.dir = Vector2.new()
			if tbl_16_upvr.Assets.SuppressionBlur then
				tbl_16_upvr.Assets.SuppressionBlur.Size = 0
			end
			if tbl_16_upvr.Assets._suppressionCC then
				tbl_16_upvr.Assets._suppressionCC.Saturation = 0
				tbl_16_upvr.Assets._suppressionCC.Brightness = 0
				tbl_16_upvr.Assets._suppressionCC.Contrast = 0
			end
			if tbl_16_upvr.Supress then
				tbl_16_upvr.Supress.ImageTransparency = 1
				tbl_16_upvr.Supress.ImageColor3 = Color3.new(1, 1, 1)
			end
		end, true)
	end
end
local function _accumulateDirFromNear_upvr(arg1, arg2) -- Line 6557, Named "_accumulateDirFromNear"
	--[[ Upvalues[1]:
		[1]: tbl_16_upvr (readonly)
	]]
	-- KONSTANTERROR: [0] 1. Error Block 1 start (CF ANALYSIS FAILED)
	local Camera = tbl_16_upvr.Camera
	-- KONSTANTERROR: [0] 1. Error Block 1 end (CF ANALYSIS FAILED)
	-- KONSTANTERROR: [4] 4. Error Block 10 start (CF ANALYSIS FAILED)
	if not arg1 then
		-- KONSTANTERROR: [5] 5. Error Block 3 start (CF ANALYSIS FAILED)
		do
			return
		end
		-- KONSTANTERROR: [5] 5. Error Block 3 end (CF ANALYSIS FAILED)
	end
	local var1203 = arg1 - Camera.CFrame.Position
	local Magnitude = var1203.Magnitude
	if Magnitude < 0.001 then
	else
		local var1205 = var1203 / Magnitude
		tbl_16_upvr.Suppression.dir = tbl_16_upvr.Suppression.dir + Vector2.new(math.clamp(var1205:Dot(Camera.CFrame.RightVector), -1, 1), math.clamp(var1205:Dot(Camera.CFrame.UpVector), -1, 1)) * arg2
		-- KONSTANTERROR: [4] 4. Error Block 10 end (CF ANALYSIS FAILED)
	end
end
local function _isTeammate_upvr(arg1) -- Line 6573, Named "_isTeammate"
	--[[ Upvalues[2]:
		[1]: tbl_6_upvr (readonly)
		[2]: module_5_upvr (readonly)
	]]
	if not arg1 then
		return false
	end
	local LocalPlayer = tbl_6_upvr.Players.LocalPlayer
	if not LocalPlayer then
		return false
	end
	if arg1 == LocalPlayer then
		return true
	end
	local any_GetPlayerTeam_result1_6 = module_5_upvr:GetPlayerTeam(LocalPlayer)
	local any_GetPlayerTeam_result1_2 = module_5_upvr:GetPlayerTeam(arg1)
	if typeof(any_GetPlayerTeam_result1_6) == "table" then
		if typeof(any_GetPlayerTeam_result1_2) == "table" then
			if any_GetPlayerTeam_result1_6.Name then
				local Name_5 = any_GetPlayerTeam_result1_2.Name
				if Name_5 then
					if any_GetPlayerTeam_result1_6.Name ~= any_GetPlayerTeam_result1_2.Name then
						Name_5 = false
					else
						Name_5 = true
					end
					return Name_5
				end
			end
		end
	end
	if not LocalPlayer:FindFirstChild("Team") then
		local TeamColor_4 = LocalPlayer:FindFirstChild("TeamColor")
	end
	if not arg1:FindFirstChild("Team") then
		local TeamColor_3 = arg1:FindFirstChild("TeamColor")
	end
	if TeamColor_4 and TeamColor_3 then
		if TeamColor_4:IsA("ValueBase") then
			local children_3 = TeamColor_3:IsA("ValueBase")
			if children_3 then
				if TeamColor_4.Value ~= TeamColor_3.Value then
					children_3 = false
				else
					children_3 = true
				end
				return children_3
			end
		end
	end
	return false
end
tbl_16_upvr.GlobalJanitor:Add(tbl_16_upvr.Bridges.Supression:Connect(function(arg1) -- Line 6600, Named "_onSuppressionEvent"
	--[[ Upvalues[7]:
		[1]: _isTeammate_upvr (readonly)
		[2]: tbl_16_upvr (readonly)
		[3]: _accumulateDirFromNear_upvr (readonly)
		[4]: tbl_6_upvr (readonly)
		[5]: _playWhizz_upvr (readonly)
		[6]: _updateUI_upvr (readonly)
		[7]: _ensureLoop_upvr (readonly)
	]]
	-- KONSTANTWARNING: Variable analysis failed. Output will have some incorrect variable assignments
	local var1231
	if type(arg1) ~= "table" then
	else
		local var1232 = arg1
		if var1232 then
			var1232 = arg1.intensity
		end
		var1231 = tonumber(var1232) or 0
		local clamped_4 = math.clamp(var1231, 0, 1)
		var1231 = 0
		if clamped_4 <= var1231 then return end
		var1231 = workspace:GetAttribute("InMenu")
		if var1231 == true then return end
		var1231 = arg1.shooter
		if not var1231 then
			var1231 = arg1.player
			if not var1231 then
				var1231 = arg1.source
			end
		end
		if var1231 then
			if typeof(var1231) == "Instance" and var1231:IsA("Player") then
				if _isTeammate_upvr(var1231) and clamped_4 * tbl_16_upvr.SUPPRESS_FRIENDLY_MULT <= 0.01 then
					do
						return
					end
					-- KONSTANTWARNING: GOTO [90] #68
				end
				-- KONSTANTWARNING: GOTO [90] #68
			end
		end
		if arg1.isTeammate == true or arg1.friendly == true then
			-- KONSTANTERROR: Expression was reused, decompilation is incorrect
			local var1234_upvw = clamped_4 * tbl_16_upvr.SUPPRESS_FRIENDLY_MULT * tbl_16_upvr.SUPPRESS_FRIENDLY_MULT
			if var1234_upvw <= 0.01 then return end
		end
		local var1235
		if not arg1.near and arg1.origin and arg1.dir then
			var1235 = arg1.dir * 12
		end
		var1235 = tbl_16_upvr.Suppression
		local strength_2 = var1235.strength
		var1235 = var1234_upvw * 0.6
		if 0.4 < strength_2 then
			var1235 *= 1 + (strength_2 - 0.4) * 0.4
		end
		tbl_16_upvr.Suppression.strength = math.clamp(strength_2 + var1235, 0, 0.92)
		_accumulateDirFromNear_upvr(arg1.origin + var1235, var1234_upvw * 0.8)
		pcall(function() -- Line 6633
			--[[ Upvalues[2]:
				[1]: tbl_16_upvr (copied, readonly)
				[2]: var1234_upvw (read and write)
			]]
			tbl_16_upvr.BobbleModule:Trigger(var1234_upvw * 2)
		end)
		if tbl_6_upvr.UserInputService.GamepadEnabled and 0.25 < var1234_upvw then
			local Gamepad1_upvr_3 = Enum.UserInputType.Gamepad1
			pcall(function() -- Line 6639
				--[[ Upvalues[3]:
					[1]: var1234_upvw (read and write)
					[2]: tbl_6_upvr (copied, readonly)
					[3]: Gamepad1_upvr_3 (readonly)
				]]
				local var1240 = var1234_upvw * 0.6
				tbl_6_upvr.HapticService:SetMotor(Gamepad1_upvr_3, Enum.VibrationMotor.Large, var1240)
				tbl_6_upvr.HapticService:SetMotor(Gamepad1_upvr_3, Enum.VibrationMotor.Small, var1240 * 0.5)
				task.delay(0.1, function() -- Line 6643
					--[[ Upvalues[2]:
						[1]: tbl_6_upvr (copied, readonly)
						[2]: Gamepad1_upvr_3 (copied, readonly)
					]]
					tbl_6_upvr.HapticService:SetMotor(Gamepad1_upvr_3, Enum.VibrationMotor.Large, 0)
					tbl_6_upvr.HapticService:SetMotor(Gamepad1_upvr_3, Enum.VibrationMotor.Small, 0)
				end)
			end)
		end
		Gamepad1_upvr_3 = typeof(arg1.whizzSound)
		if Gamepad1_upvr_3 == "string" then
			Gamepad1_upvr_3 = string.find(arg1.whizzSound, "rbxassetid://")
			if Gamepad1_upvr_3 then
				Gamepad1_upvr_3 = _playWhizz_upvr
				Gamepad1_upvr_3(arg1.whizzSound, var1234_upvw * 0.85)
			end
		end
		Gamepad1_upvr_3 = _updateUI_upvr
		Gamepad1_upvr_3()
		Gamepad1_upvr_3 = _ensureLoop_upvr
		Gamepad1_upvr_3()
	end
end), "Disconnect")
;(function() -- Line 5759, Named "initGlobal"
	--[[ Upvalues[7]:
		[1]: tbl_16_upvr (readonly)
		[2]: ShowHitMarker_upvr (readonly)
		[3]: tbl_6_upvr (readonly)
		[4]: MuzzleFXFunc_upvr (readonly)
		[5]: UnbindAllActions_upvr (readonly)
		[6]: Unequip_upvr (readonly)
		[7]: initCharacter_upvr (readonly)
	]]
	tbl_16_upvr.GlobalJanitor:Add(tbl_16_upvr.Bridges.HitConfirmBridge:Connect(function(arg1) -- Line 5762
		--[[ Upvalues[1]:
			[1]: ShowHitMarker_upvr (copied, readonly)
		]]
		if type(arg1) ~= "table" then
		else
			ShowHitMarker_upvr(arg1.isHeadshot or false, arg1.damage or 0)
		end
	end), "Disconnect")
	tbl_16_upvr.GlobalJanitor:Add(tbl_16_upvr.Bridges.ReplicateSound:Connect(function(arg1) -- Line 5770
		--[[ Upvalues[3]:
			[1]: tbl_6_upvr (copied, readonly)
			[2]: tbl_16_upvr (copied, readonly)
			[3]: MuzzleFXFunc_upvr (copied, readonly)
		]]
		if type(arg1) ~= "table" then
			warn("no table")
		else
			if arg1.shooterUserId == tbl_6_upvr.Players.LocalPlayer.UserId then
				warn("same id")
				return
			end
			local any_GetPlayerByUserId_result1 = tbl_6_upvr.Players:GetPlayerByUserId(arg1.shooterUserId)
			if any_GetPlayerByUserId_result1 then
				if any_GetPlayerByUserId_result1.Character then
					tbl_16_upvr.Modules.SoundHandle:FireSound(arg1.muzzle, arg1.tool, arg1.SoundFolder)
					MuzzleFXFunc_upvr(arg1.muzzle, arg1.suppressor)
				end
			end
		end
	end), "Disconnect")
	tbl_16_upvr.GlobalJanitor:Add(tbl_16_upvr.RefillRemotes.AmmoRefillQuery.OnClientEvent:Connect(function(arg1) -- Line 5786
		--[[ Upvalues[1]:
			[1]: tbl_16_upvr (copied, readonly)
		]]
		local any_ComputeNeededSpareOnly_result1 = tbl_16_upvr.AmmoRefill.ComputeNeededSpareOnly()
		local var1064 = arg1
		if var1064 then
			var1064 = arg1.maxPerUse
		end
		local var1065 = arg1
		if var1065 then
			var1065 = arg1.pool
		end
		local tbl_11 = {}
		local var1067 = arg1
		if var1067 then
			var1067 = arg1.token
		end
		tbl_11.token = var1067
		tbl_11.need = math.min(any_ComputeNeededSpareOnly_result1, math.max(0, tonumber(var1064) or any_ComputeNeededSpareOnly_result1), math.max(0, tonumber(var1065) or any_ComputeNeededSpareOnly_result1))
		tbl_16_upvr.RefillRemotes.AmmoRefillReply:FireServer(tbl_11)
	end), "Disconnect")
	tbl_16_upvr.GlobalJanitor:Add(tbl_16_upvr.RefillRemotes.AmmoRefillGrant.OnClientEvent:Connect(function(arg1) -- Line 5801
		--[[ Upvalues[1]:
			[1]: tbl_16_upvr (copied, readonly)
		]]
		local var1069 = arg1
		if var1069 then
			var1069 = arg1.amount
		end
		local var1070 = tonumber(var1069) or 0
		if 0 < var1070 then
			tbl_16_upvr.AmmoRefill.ApplyGrantedToEquipped(var1070)
		end
	end), "Disconnect")
	tbl_16_upvr.GlobalJanitor:Add(tbl_16_upvr.LocalPlayer.CharacterAdded:Connect(function() -- Line 5810
		--[[ Upvalues[5]:
			[1]: tbl_16_upvr (copied, readonly)
			[2]: tbl_6_upvr (copied, readonly)
			[3]: UnbindAllActions_upvr (copied, readonly)
			[4]: Unequip_upvr (copied, readonly)
			[5]: initCharacter_upvr (copied, readonly)
		]]
		local ViewmodelBindName_upvr = tbl_16_upvr.Settings.ViewmodelBindName
		pcall(function() -- Line 534
			--[[ Upvalues[2]:
				[1]: tbl_6_upvr (copied, readonly)
				[2]: ViewmodelBindName_upvr (readonly)
			]]
			tbl_6_upvr.RunService:UnbindFromRenderStep(ViewmodelBindName_upvr)
		end)
		ViewmodelBindName_upvr = pcall
		local var1075_upvr = "WeaponHeadLerp"
		ViewmodelBindName_upvr(function() -- Line 534
			--[[ Upvalues[2]:
				[1]: tbl_6_upvr (copied, readonly)
				[2]: var1075_upvr (readonly)
			]]
			tbl_6_upvr.RunService:UnbindFromRenderStep(var1075_upvr)
		end)
		ViewmodelBindName_upvr = UnbindAllActions_upvr
		ViewmodelBindName_upvr()
		ViewmodelBindName_upvr = Unequip_upvr
		ViewmodelBindName_upvr()
		ViewmodelBindName_upvr = tbl_16_upvr.CharacterJanitor:Cleanup
		ViewmodelBindName_upvr()
		ViewmodelBindName_upvr = initCharacter_upvr
		ViewmodelBindName_upvr()
		ViewmodelBindName_upvr = workspace
		var1075_upvr = "EnableToolEquip"
		ViewmodelBindName_upvr = ViewmodelBindName_upvr:SetAttribute
		ViewmodelBindName_upvr(var1075_upvr, true)
	end), "Disconnect")
end)()
initCharacter_upvr()
tbl_16_upvr.CharacterJanitor:Add(function() -- Line 6666
	--[[ Upvalues[1]:
		[1]: tbl_16_upvr (readonly)
	]]
	if tbl_16_upvr.Modules.Comtacs then
		tbl_16_upvr.Modules.Comtacs:Enable(false)
	end
end, true)
;(function() -- Line 579, Named "buildBinds"
	--[[ Upvalues[3]:
		[1]: tbl_16_upvr (readonly)
		[2]: tbl_6_upvr (readonly)
		[3]: getPlatformIcons_upvr (readonly)
	]]
	local var89
	if tbl_16_upvr._bindsBuilt then
	else
		tbl_16_upvr._bindsBuilt = true
		var89 = tbl_6_upvr
		if var89.UserInputService.TouchEnabled then return end
		var89 = "GameUI"
		if tbl_16_upvr.LocalPlayer:GetAttribute(var89) == false then return end
		var89 = tbl_16_upvr
		var89 = "Template"
		local UserInputService = game:GetService("UserInputService")
		if UserInputService.GamepadEnabled then
			var89 = "Console"
		elseif UserInputService.KeyboardEnabled then
			var89 = "Computer"
		else
			var89 = UserInputService.TouchEnabled and "MOBILE"
		end
		for _, v_33 in pairs({tbl_16_upvr.InputBindings, tbl_16_upvr.InputBindingsAlways}) do
			for i_38, v_34 in pairs(v_33) do
				local var98 = v_34[var89]
				local var99
				if typeof(var98) == "EnumItem" and (var98.EnumType == Enum.KeyCode or var98.EnumType == Enum.UserInputType) then
					var99 = getPlatformIcons_upvr():FindFirstChild(var98.Name)
				else
					var99 = nil
				end
				if var99 and v_34[var89] then
					local clone_2 = var89.GunHud.KeyBindHelp:WaitForChild(var89):Clone()
					clone_2.Parent = tbl_16_upvr.GunHud.KeyBindHelp
					clone_2.Visible = false
					clone_2.Name = i_38
					clone_2.KeyboardLabel.TextLabel.Text = string.upper(v_34[var89].Name)
					clone_2.ControlLabel.Text = string.upper(i_38)
					tbl_16_upvr.KeybindUIs[i_38] = clone_2
				end
			end
		end
	end
end)()
tbl_16_upvr.Ragdoll = tbl_16_upvr.Remotes.Ragdoll
tbl_16_upvr.GlobalJanitor:Add(tbl_16_upvr.Ragdoll.OnClientEvent:Connect(function(arg1, arg2) -- Line 6676
	--[[ Upvalues[1]:
		[1]: tbl_16_upvr (readonly)
	]]
	if not tbl_16_upvr.humanoid then
	else
		if not tbl_16_upvr.Character then return end
		if arg1 == "Make" then
			tbl_16_upvr.humanoid.PlatformStand = true
			tbl_16_upvr.humanoid:SetStateEnabled(Enum.HumanoidStateType.GettingUp, false)
			tbl_16_upvr.humanoid:SetStateEnabled(Enum.HumanoidStateType.Jumping, false)
			tbl_16_upvr.humanoid:SetStateEnabled(Enum.HumanoidStateType.Running, false)
			tbl_16_upvr.humanoid:ChangeState(Enum.HumanoidStateType.Physics)
			return
		end
		if arg1 == "Destroy" then
			tbl_16_upvr.humanoid:SetStateEnabled(Enum.HumanoidStateType.GettingUp, true)
			tbl_16_upvr.humanoid:SetStateEnabled(Enum.HumanoidStateType.Jumping, true)
			tbl_16_upvr.humanoid:SetStateEnabled(Enum.HumanoidStateType.Running, true)
			tbl_16_upvr.humanoid.PlatformStand = false
			tbl_16_upvr.humanoid:ChangeState(Enum.HumanoidStateType.GettingUp)
			return
		end
		if arg1 == nil and arg2 == "manualM" then
			tbl_16_upvr.humanoid.PlatformStand = true
			tbl_16_upvr.humanoid:SetStateEnabled(Enum.HumanoidStateType.GettingUp, false)
			tbl_16_upvr.humanoid:SetStateEnabled(Enum.HumanoidStateType.Jumping, false)
			tbl_16_upvr.humanoid:SetStateEnabled(Enum.HumanoidStateType.Running, false)
			tbl_16_upvr.humanoid:ChangeState(Enum.HumanoidStateType.Physics)
			return
		end
		if arg1 == nil and arg2 == "manualD" then
			tbl_16_upvr.humanoid:SetStateEnabled(Enum.HumanoidStateType.GettingUp, true)
			tbl_16_upvr.humanoid:SetStateEnabled(Enum.HumanoidStateType.Jumping, true)
			tbl_16_upvr.humanoid:SetStateEnabled(Enum.HumanoidStateType.Running, true)
			tbl_16_upvr.humanoid.PlatformStand = false
			tbl_16_upvr.humanoid:ChangeState(Enum.HumanoidStateType.GettingUp)
		end
	end
end), "Disconnect")
local tbl_3_upvr = {
	Head = Vector3.new(1.20000, 1, 1);
	Torso = Vector3.new(2, 2, 1);
	Default = Vector3.new(1, 2, 1);
}
local var1246_upvw = 0
tbl_6_upvr.RunService.Heartbeat:Connect(function() -- Line 6716
	--[[ Upvalues[4]:
		[1]: var1246_upvw (read and write)
		[2]: tbl_6_upvr (readonly)
		[3]: tbl_16_upvr (readonly)
		[4]: tbl_3_upvr (readonly)
	]]
	local os_clock_result1 = os.clock()
	if os_clock_result1 - var1246_upvw < 0.5 then
	else
		var1246_upvw = os_clock_result1
		for _, v_44 in ipairs(tbl_6_upvr.Players:GetPlayers()) do
			local Character_3 = v_44.Character
			if v_44 ~= tbl_16_upvr.LocalPlayer then
				if Character_3 then
					local children_5 = Character_3:GetChildren()
					for i_51 = 1, #children_5 do
						local var1256 = children_5[i_51]
						if var1256:IsA("BasePart") then
							if 4.5 < var1256.Size.Magnitude then
								local Name = var1256.Name
								if Name == "Head" then
									var1256.Size = tbl_3_upvr.Head
								elseif Name:find("Torso") or Name == "HumanoidRootPart" then
									var1256.Size = tbl_3_upvr.Torso
								else
									var1256.Size = tbl_3_upvr.Default
								end
								var1256.CanCollide = true
								var1256.Transparency = 0
							end
						end
					end
				end
			end
		end
	end
end)
