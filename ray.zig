use @cImport({ @cInclude("raylib.h"); });

// pub const lib = @cImport({
//     // @cDefine("_NO_CRT_STDIO_INLINE", "1");
//     // @cDefine("_GNU_SOURCE", "1");
//     // @cDefine("PLATFORM", "PLATFORM_DESKTOP");
//     @cInclude("raylib.h");
// });

pub fn CLiteral(r: u8, g: u8, b: u8, a: u8) Color {
    return Color { .r = r, .g = g, .b = b, .a = a };
}
// pub const LIGHTGRAY = 

pub const LIGHTGRAY = CLiteral(200, 200, 200, 255);   // Light Gray
pub const GRAY =      CLiteral(130, 130, 130, 255);   // Gray
pub const DARKGRAY =  CLiteral(80, 80, 80, 255);      // Dark Gray
pub const YELLOW =    CLiteral(253, 249, 0, 255);     // Yellow
pub const GOLD =      CLiteral(255, 203, 0, 255);     // Gold
pub const ORANGE =    CLiteral(255, 161, 0, 255);     // Orange
pub const PINK =      CLiteral(255, 109, 194, 255);   // Pink
pub const RED =       CLiteral(230, 41, 55, 255);     // Red
pub const MAROON =    CLiteral(190, 33, 55, 255);     // Maroon
pub const GREEN =     CLiteral(0, 228, 48, 255);      // Green
pub const LIME =      CLiteral(0, 158, 47, 255);      // Lime
pub const DARKGREEN = CLiteral(0, 117, 44, 255);      // Dark Green
pub const SKYBLUE =   CLiteral(102, 191, 255, 255);   // Sky Blue
pub const BLUE =      CLiteral(0, 121, 241, 255);     // Blue
pub const DARKBLUE =  CLiteral(0, 82, 172, 255);      // Dark Blue
pub const PURPLE =    CLiteral(200, 122, 255, 255);   // Purple
pub const VIOLET =    CLiteral(135, 60, 190, 255);    // Violet
pub const DARKPURPLE =CLiteral(112, 31, 126, 255);    // Dark Purple
pub const BEIGE =     CLiteral(211, 176, 131, 255);   // Beige
pub const BROWN =     CLiteral(127, 106, 79, 255);    // Brown
pub const DARKBROWN = CLiteral(76, 63, 47, 255);      // Dark Brown

pub const WHITE =     CLiteral(255, 255, 255, 255);   // White
pub const BLACK =     CLiteral(0, 0, 0, 255);         // Black
pub const BLANK =     CLiteral(0, 0, 0, 0);           // Blank (Transparent)
pub const MAGENTA =   CLiteral(255, 0, 255, 255);     // Magenta
pub const RAYWHITE =  CLiteral(245, 245, 245, 255);   // My own White (raylib logo)


// // window related functions
// pub const InitWindow = lib.InitWindow;
// pub const WindowShouldClose = lib.WindowShouldClose;
// pub const CloseWindow = lib.CloseWindow;
// pub const IsWindowReady = lib.IsWindowReady;
// pub const IsWindowMinimized = lib.IsWindowMinimized;
// pub const IsWindowResized = lib.IsWindowResized;
// pub const IsWindowHidden = lib.IsWindowHidden;
// pub const ToggleFullscreen = lib.ToggleFullscreen;
// pub const UnhideWindow = lib.UnhideWindow;
// pub const HideWindow = lib.HideWindow;
// pub const SetWindowIcon = lib.SetWindowIcon;
// pub const SetWindowTitle = lib.SetWindowTitle;
// pub const SetWindowPosition = lib.SetWindowPosition;
// pub const SetWindowMonitor = lib.SetWindowMonitor;
// pub const SetWindowMinSize = lib.SetWindowMinSize;
// pub const SetWindowSize = lib.SetWindowSize;
// pub const GetWindowHandle = lib.GetWindowHandle;
// pub const GetScreenWidth = lib.GetScreenWidth;
// pub const GetScreenHeight = lib.GetScreenHeight;
// pub const GetMonitorCount = lib.GetMonitorCount;
// pub const GetMonitorWidth = lib.GetMonitorWidth;
// pub const GetMonitorHeight = lib.GetMonitorHeight;
// pub const GetMonitorPhysicalWidth = lib.GetMonitorPhysicalWidth;
// pub const GetMonitorPhysicalHeight = lib.GetMonitorPhysicalHeight;
// pub const GetMonitorName = lib.GetMonitorName;
// pub const GetClipboardText = lib.GetClipboardText;
// pub const SetClipboardText = lib.SetClipboardText;

// // Cursor-related functions
// pub const ShowCursor = lib.ShowCursor;
// pub const HideCursor = lib.HideCursor;
// pub const IsCursorHidden = lib.IsCursorHidden;
// pub const EnableCursor = lib.EnableCursor;
// pub const DisableCursor = lib.DisableCursor;

// // Drawing-related functions            
// pub const ClearBackground = lib.ClearBackground;
// pub const BeginDrawing = lib.BeginDrawing;
// pub const EndDrawing = lib.EndDrawing;
// pub const BeginMode2D = lib.BeginMode2D;
// pub const EndMode2D = lib.EndMode2D;
// pub const BeginMode3D = lib.BeginMode3D;
// pub const EndMode3D = lib.EndMode3D;
// pub const BeginTextureMode = lib.BeginTextureMode;
// pub const EndTextureMode = lib.EndTextureMode;

// // Screen-space-related functions           
// pub const GetMouseRay = lib.GetMouseRay;
// pub const GetWorldToScreen = lib.GetWorldToScreen;
// pub const GetCameraMatrix = lib.GetCameraMatrix;

// // Timing-related functions         
// pub const SetTargetFPS = lib.SetTargetFPS;
// pub const GetFPS = lib.GetFPS;
// pub const GetFrameTime = lib.GetFrameTime;
// pub const GetTime = lib.GetTime;

// // Color-related functions          
// pub const ColorToInt = lib.ColorToInt;
// pub const ColorNormalize = lib.ColorNormalize;
// pub const ColorToHSV = lib.ColorToHSV;
// pub const ColorFromHSV = lib.ColorFromHSV;
// pub const GetColor = lib.GetColor;
// pub const Fade = lib.Fade;

// // Misc. functions          
// pub const SetConfigFlags = lib.SetConfigFlags;
// pub const SetTraceLogLevel = lib.SetTraceLogLevel;
// pub const SetTraceLogExit = lib.SetTraceLogExit;
// pub const SetTraceLogCallback = lib.SetTraceLogCallback;
// pub const TraceLog = lib.TraceLog;
// pub const TakeScreenshot = lib.TakeScreenshot;
// pub const GetRandomValue = lib.GetRandomValue;

// // Files management functions           
// pub const FileExists = lib.FileExists;
// pub const IsFileExtension = lib.IsFileExtension;
// pub const GetExtension = lib.GetExtension;
// pub const GetFileName = lib.GetFileName;
// pub const GetFileNameWithoutExt = lib.GetFileNameWithoutExt;
// pub const GetDirectoryPath = lib.GetDirectoryPath;
// pub const GetWorkingDirectory = lib.GetWorkingDirectory;
// pub const GetDirectoryFiles = lib.GetDirectoryFiles;
// pub const ClearDirectoryFiles = lib.ClearDirectoryFiles;
// pub const ChangeDirectory = lib.ChangeDirectory;
// pub const IsFileDropped = lib.IsFileDropped;
// pub const GetDroppedFiles = lib.GetDroppedFiles;
// pub const ClearDroppedFiles = lib.ClearDroppedFiles;
// pub const GetFileModTime = lib.GetFileModTime;

// // Persistent storage management            
// pub const StorageSaveValue = lib.StorageSaveValue;
// pub const StorageLoadValue = lib.StorageLoadValue;

// pub const OpenURL = lib.OpenURL;

// //------------------------------------------------------------------------------------
// // Input Handling Functions
// //------------------------------------------------------------------------------------

// // Input-related functions: keyb
// pub const IsKeyPressed = lib.IsKeyPressed;
// pub const IsKeyDown = lib.IsKeyDown;
// pub const IsKeyReleased = lib.IsKeyReleased;
// pub const IsKeyUp = lib.IsKeyUp;
// pub const GetKeyPressed = lib.GetKeyPressed;
// pub const SetExitKey = lib.SetExitKey;

// // Input-related functions: gamepads                
// pub const IsGamepadAvailable = lib.IsGamepadAvailable;
// pub const IsGamepadName = lib.IsGamepadName;
// pub const GetGamepadName = lib.GetGamepadName;
// pub const IsGamepadButtonPressed = lib.IsGamepadButtonPressed;
// pub const IsGamepadButtonDown = lib.IsGamepadButtonDown;
// pub const IsGamepadButtonReleased = lib.IsGamepadButtonReleased;
// pub const IsGamepadButtonUp = lib.IsGamepadButtonUp;
// pub const GetGamepadButtonPressed = lib.GetGamepadButtonPressed;
// pub const GetGamepadAxisCount = lib.GetGamepadAxisCount;
// pub const GetGamepadAxisMovement = lib.GetGamepadAxisMovement;

// // Input-related functions: mouse               
// pub const IsMouseButtonPressed = lib.IsMouseButtonPressed;
// pub const IsMouseButtonDown = lib.IsMouseButtonDown;
// pub const IsMouseButtonReleased = lib.IsMouseButtonReleased;
// pub const IsMouseButtonUp = lib.IsMouseButtonUp;
// pub const GetMouseX = lib.GetMouseX;
// pub const GetMouseY = lib.GetMouseY;
// pub const GetMousePosition = lib.GetMousePosition;
// pub const SetMousePosition = lib.SetMousePosition;
// pub const SetMouseOffset = lib.SetMouseOffset;
// pub const SetMouseScale = lib.SetMouseScale;
// pub const GetMouseWheelMove = lib.GetMouseWheelMove;

// // Input-related functions: touch               
// pub const GetTouchX = lib.GetTouchX;
// pub const GetTouchY = lib.GetTouchY;
// pub const GetTouchPosition = lib.GetTouchPosition;

// //------------------------------------------------------------------------------------
// // Gestures and Touch Handling Functions (Module: gestures)
// //------------------------------------------------------------------------------------
// pub const SetGesturesEnabled = lib.SetGesturesEnabled;
// pub const IsGestureDetected = lib.IsGestureDetected;
// pub const GetGestureDetected = lib.GetGestureDetected;
// pub const GetTouchPointsCount = lib.GetTouchPointsCount;
// pub const GetGestureHoldDuration = lib.GetGestureHoldDuration;
// pub const GetGestureDragVector = lib.GetGestureDragVector;
// pub const GetGestureDragAngle = lib.GetGestureDragAngle;
// pub const GetGesturePinchVector = lib.GetGesturePinchVector;
// pub const GetGesturePinchAngle = lib.GetGesturePinchAngle;

// //------------------------------------------------------------------------------------
// // Camera System Functions (Module: camera)
// //------------------------------------------------------------------------------------
// pub const SetCameraMode = lib.SetCameraMode;
// pub const UpdateCamera = lib.UpdateCamera;
            
// pub const SetCameraPanControl = lib.SetCameraPanControl;
// pub const SetCameraAltControl = lib.SetCameraAltControl;
// pub const SetCameraSmoothZoomControl = lib.SetCameraSmoothZoomControl;
// pub const SetCameraMoveControls = lib.SetCameraMoveControls;


// // Basic shapes drawing functions
// pub const DrawPixel = lib.DrawPixel;
// pub const DrawPixelV = lib.DrawPixelV;
// pub const DrawLine = lib.DrawLine;
// pub const DrawLineV = lib.DrawLineV;
// pub const DrawLineEx = lib.DrawLineEx;
// pub const DrawLineBezier = lib.DrawLineBezier;
// pub const DrawCircle = lib.DrawCircle;
// pub const DrawCircleSector = lib.DrawCircleSector;
// pub const DrawCircleSectorLines = lib.DrawCircleSectorLines;
// pub const DrawCircleGradient = lib.DrawCircleGradient;
// pub const DrawCircleV = lib.DrawCircleV;
// pub const DrawCircleLines = lib.DrawCircleLines;
// pub const DrawRing = lib.DrawRing;
// pub const DrawRingLines = lib.DrawRingLines;
// pub const DrawRectangle = lib.DrawRectangle;
// pub const DrawRectangleV = lib.DrawRectangleV;
// pub const DrawRectangleRec = lib.DrawRectangleRec;
// pub const DrawRectanglePro = lib.DrawRectanglePro;
// pub const DrawRectangleGradientV = lib.DrawRectangleGradientV;
// pub const DrawRectangleGradientH = lib.DrawRectangleGradientH;
// pub const DrawRectangleGradientEx = lib.DrawRectangleGradientEx;
// pub const DrawRectangleLines = lib.DrawRectangleLines;
// pub const DrawRectangleLinesEx = lib.DrawRectangleLinesEx;
// pub const DrawRectangleRounded = lib.DrawRectangleRounded;
// pub const DrawRectangleRoundedLines = lib.DrawRectangleRoundedLines;
// pub const DrawTriangle = lib.DrawTriangle;
// pub const DrawTriangleLines = lib.DrawTriangleLines;
// pub const DrawPoly = lib.DrawPoly;
// pub const DrawPolyEx = lib.DrawPolyEx;
// pub const DrawPolyExLines = lib.DrawPolyExLines;

// pub const SetShapesTexture = lib.SetShapesTexture;

// // Basic shapes collision detection functions
// pub const CheckCollisionRecs = lib.CheckCollisionRecs;
// pub const CheckCollisionCircles = lib.CheckCollisionCircles;
// pub const CheckCollisionCircleRec = lib.CheckCollisionCircleRec;
// pub const GetCollisionRec = lib.GetCollisionRec;
// pub const CheckCollisionPointRec = lib.CheckCollisionPointRec;
// pub const CheckCollisionPointCircle = lib.CheckCollisionPointCircle;
// pub const CheckCollisionPointTriangle = lib.CheckCollisionPointTriangle;

// // Image/Texture2D data loading/unloading/saving functions
// pub const LoadImage = lib.LoadImage;
// pub const LoadImageEx = lib.LoadImageEx;
// pub const LoadImagePro = lib.LoadImagePro;
// pub const LoadImageRaw = lib.LoadImageRaw;
// pub const ExportImage = lib.ExportImage;
// pub const ExportImageAsCode = lib.ExportImageAsCode;
// pub const LoadTexture = lib.LoadTexture;
// pub const LoadTextureFromImage = lib.LoadTextureFromImage;
// pub const LoadTextureCubemap = lib.LoadTextureCubemap;
// pub const LoadRenderTexture = lib.LoadRenderTexture;
// pub const UnloadImage = lib.UnloadImage;
// pub const UnloadTexture = lib.UnloadTexture;
// pub const UnloadRenderTexture = lib.UnloadRenderTexture;
// pub const GetImageData = lib.GetImageData;
// pub const GetImageDataNormalized = lib.GetImageDataNormalized;
// pub const GetPixelDataSize = lib.GetPixelDataSize;
// pub const GetTextureData = lib.GetTextureData;
// pub const GetScreenData = lib.GetScreenData;
// pub const UpdateTexture = lib.UpdateTexture;
                                                                                                        
// // Image manipulation functions                                                                     
// pub const ImageCopy = lib.ImageCopy;
// pub const ImageToPOT = lib.ImageToPOT;
// pub const ImageFormat = lib.ImageFormat;
// pub const ImageAlphaMask = lib.ImageAlphaMask;
// pub const ImageAlphaClear = lib.ImageAlphaClear;
// pub const ImageAlphaCrop = lib.ImageAlphaCrop;
// pub const ImageAlphaPremultiply = lib.ImageAlphaPremultiply;
// pub const ImageCrop = lib.ImageCrop;
// pub const ImageResize = lib.ImageResize;
// pub const ImageResizeNN = lib.ImageResizeNN;
// pub const ImageResizeCanvas = lib.ImageResizeCanvas;
// pub const ImageMipmaps = lib.ImageMipmaps;
// pub const ImageDither = lib.ImageDither;
// pub const ImageExtractPalette = lib.ImageExtractPalette;
// pub const ImageText = lib.ImageText;
// pub const ImageTextEx = lib.ImageTextEx;
// pub const ImageDraw = lib.ImageDraw;
// pub const ImageDrawRectangle = lib.ImageDrawRectangle;
// pub const ImageDrawRectangleLines = lib.ImageDrawRectangleLines;
// pub const ImageDrawText = lib.ImageDrawText;
// pub const ImageDrawTextEx = lib.ImageDrawTextEx;
// pub const ImageFlipVertical = lib.ImageFlipVertical;
// pub const ImageFlipHorizontal = lib.ImageFlipHorizontal;
// pub const ImageRotateCW = lib.ImageRotateCW;
// pub const ImageRotateCCW = lib.ImageRotateCCW;
// pub const ImageColorTint = lib.ImageColorTint;
// pub const ImageColorInvert = lib.ImageColorInvert;
// pub const ImageColorGrayscale = lib.ImageColorGrayscale;
// pub const ImageColorContrast = lib.ImageColorContrast;
// pub const ImageColorBrightness = lib.ImageColorBrightness;
// pub const ImageColorReplace = lib.ImageColorReplace;
                                                                                                        
// // Image generation functions                                                                       
// pub const GenImageColor = lib.GenImageColor;
// pub const GenImageGradientV = lib.GenImageGradientV;
// pub const GenImageGradientH = lib.GenImageGradientH;
// pub const GenImageGradientRadial = lib.GenImageGradientRadial;
// pub const GenImageChecked = lib.GenImageChecked;
// pub const GenImageWhiteNoise = lib.GenImageWhiteNoise;
// pub const GenImagePerlinNoise = lib.GenImagePerlinNoise;
// pub const GenImageCellular = lib.GenImageCellular;

// // Texture2D configuration functions                                                                
// pub const GenTextureMipmaps = lib.GenTextureMipmaps;
// pub const SetTextureFilter = lib.SetTextureFilter;
// pub const SetTextureWrap = lib.SetTextureWrap;
                                                                                                        
// // Texture2D drawing functions                                                                      
// pub const DrawTexture = lib.DrawTexture;
// pub const DrawTextureV = lib.DrawTextureV;
// pub const DrawTextureEx = lib.DrawTextureEx;
// pub const DrawTextureRec = lib.DrawTextureRec;
// pub const DrawTextureQuad = lib.DrawTextureQuad;
// pub const DrawTexturePro = lib.DrawTexturePro;
// pub const DrawTextureNPatch = lib.DrawTextureNPatch;

// // Font loading/unloading functions
// pub const GetFontDefault = lib.GetFontDefault;
// pub const LoadFont = lib.LoadFont;
// pub const LoadFontEx = lib.LoadFontEx;
// pub const LoadFontFromImage = lib.LoadFontFromImage;
// pub const LoadFontData = lib.LoadFontData;
// pub const GenImageFontAtlas = lib.GenImageFontAtlas;
// pub const UnloadFont = lib.UnloadFont;

// // Text drawing functions
// pub const DrawFPS = lib.DrawFPS;
// pub const DrawText = lib.DrawText;
// pub const DrawTextEx = lib.DrawTextEx;
// pub const DrawTextRec = lib.DrawTextRec;
// pub const DrawTextRecEx = lib.DrawTextRecEx;


// // Text misc. functions
// pub const MeasureText = lib.MeasureText;
// pub const MeasureTextEx = lib.MeasureTextEx;
// pub const GetGlyphIndex = lib.GetGlyphIndex;

// // Text strings management functions
// // NOTE: Some strings allocate memory internally for returned strings, just be careful!
// pub const TextIsEqual = lib.TextIsEqual;
// pub const TextLength = lib.TextLength;
// pub const TextFormat = lib.TextFormat;
// pub const TextSubtext = lib.TextSubtext;
// pub const TextReplace = lib.TextReplace;
// pub const TextInsert = lib.TextInsert;
// pub const TextJoin = lib.TextJoin;
// pub const TextSplit = lib.TextSplit;
// pub const TextAppend = lib.TextAppend;
// pub const TextFindIndex = lib.TextFindIndex;
// pub const TextToUpper = lib.TextToUpper;
// pub const TextToLower = lib.TextToLower;
// pub const TextToPascal = lib.TextToPascal;
// pub const TextToInteger = lib.TextToInteger;

// // Basic geometric 3D shapes drawing functions
// pub const DrawLine3D = lib.DrawLine3D;
// pub const DrawCircle3D = lib.DrawCircle3D;
// pub const DrawCube = lib.DrawCube;
// pub const DrawCubeV = lib.DrawCubeV;
// pub const DrawCubeWires = lib.DrawCubeWires;
// pub const DrawCubeWiresV = lib.DrawCubeWiresV;
// pub const DrawCubeTexture = lib.DrawCubeTexture;
// pub const DrawSphere = lib.DrawSphere;
// pub const DrawSphereEx = lib.DrawSphereEx;
// pub const DrawSphereWires = lib.DrawSphereWires;
// pub const DrawCylinder = lib.DrawCylinder;
// pub const DrawCylinderWires = lib.DrawCylinderWires;
// pub const DrawPlane = lib.DrawPlane;
// pub const DrawRay = lib.DrawRay;
// pub const DrawGrid = lib.DrawGrid;
// pub const DrawGizmo = lib.DrawGizmo;

// // Model loading/unloading functions
// pub const LoadModel = lib.LoadModel;
// pub const LoadModelFromMesh = lib.LoadModelFromMesh;
// pub const UnloadModel = lib.UnloadModel;

// // Mesh loading/unloading functions
// pub const LoadMeshes = lib.LoadMeshes;
// pub const ExportMesh = lib.ExportMesh;
// pub const UnloadMesh = lib.UnloadMesh;

// // Material loading/unloading functions
// pub const LoadMaterials = lib.LoadMaterials;
// pub const LoadMaterialDefault = lib.LoadMaterialDefault;
// pub const UnloadMaterial = lib.UnloadMaterial;
// pub const SetMaterialTexture = lib.SetMaterialTexture;
// pub const SetModelMeshMaterial = lib.SetModelMeshMaterial;

// // Model animations loading/unloading functions
// pub const LoadModelAnimations = lib.LoadModelAnimations;
// pub const UpdateModelAnimation = lib.UpdateModelAnimation;
// pub const UnloadModelAnimation = lib.UnloadModelAnimation;
// pub const IsModelAnimationValid = lib.IsModelAnimationValid;

//     // Mesh generation functions
// pub const GenMeshPoly = lib.GenMeshPoly;
// pub const GenMeshPlane = lib.GenMeshPlane;
// pub const GenMeshCube = lib.GenMeshCube;
// pub const GenMeshSphere = lib.GenMeshSphere;
// pub const GenMeshHemiSphere = lib.GenMeshHemiSphere;
// pub const GenMeshCylinder = lib.GenMeshCylinder;
// pub const GenMeshTorus = lib.GenMeshTorus;
// pub const GenMeshKnot = lib.GenMeshKnot;
// pub const GenMeshHeightmap = lib.GenMeshHeightmap;
// pub const GenMeshCubicmap = lib.GenMeshCubicmap;

// // Mesh manipulation functions
// pub const MeshBoundingBox = lib.MeshBoundingBox;
// pub const MeshTangents = lib.MeshTangents;
// pub const MeshBinormals = lib.MeshBinormals;

// // Model drawing functions
// pub const DrawModel = lib.DrawModel;
// pub const DrawModelEx = lib.DrawModelEx;
// pub const DrawModelWires = lib.DrawModelWires;
// pub const DrawModelWiresEx = lib.DrawModelWiresEx;
// pub const DrawBoundingBox = lib.DrawBoundingBox;
// pub const DrawBillboard = lib.DrawBillboard;
// pub const DrawBillboardRec = lib.DrawBillboardRec;

// // Collision detection functions
// pub const CheckCollisionSpheres = lib.CheckCollisionSpheres;
// pub const CheckCollisionBoxes = lib.CheckCollisionBoxes;
// pub const CheckCollisionBoxSphere = lib.CheckCollisionBoxSphere;
// pub const CheckCollisionRaySphere = lib.CheckCollisionRaySphere;
// pub const CheckCollisionRaySphereEx = lib.CheckCollisionRaySphereEx;
// pub const CheckCollisionRayBox = lib.CheckCollisionRayBox;
// pub const GetCollisionRayModel = lib.GetCollisionRayModel;
// pub const GetCollisionRayTriangle = lib.GetCollisionRayTriangle;
// pub const GetCollisionRayGround = lib.GetCollisionRayGround;

// // Shader loading/unloading functions
// pub const LoadText = lib.LoadText;
// pub const LoadShader = lib.LoadShader;
// pub const LoadShaderCode = lib.LoadShaderCode;
// pub const UnloadShader = lib.UnloadShader;
                                
// pub const GetShaderDefault = lib.GetShaderDefault;
// pub const GetTextureDefault = lib.GetTextureDefault;
                                
// // Shader configuration functions                               
// pub const GetShaderLocation = lib.GetShaderLocation;
// pub const SetShaderValue = lib.SetShaderValue;
// pub const SetShaderValueV = lib.SetShaderValueV;
// pub const SetShaderValueMatrix = lib.SetShaderValueMatrix;
// pub const SetShaderValueTexture = lib.SetShaderValueTexture;
// pub const SetMatrixProjection = lib.SetMatrixProjection;
// pub const SetMatrixModelview = lib.SetMatrixModelview;
// pub const GetMatrixModelview = lib.GetMatrixModelview;

// // Shading begin/end functions
// pub const BeginShaderMode = lib.BeginShaderMode;
// pub const EndShaderMode = lib.EndShaderMode;
// pub const BeginBlendMode = lib.BeginBlendMode;
// pub const EndBlendMode = lib.EndBlendMode;
// pub const BeginScissorMode = lib.BeginScissorMode;
// pub const EndScissorMode = lib.EndScissorMode;

// // VR control functions
// pub const InitVrSimulator = lib.InitVrSimulator;
// pub const CloseVrSimulator = lib.CloseVrSimulator;
// pub const UpdateVrTracking = lib.UpdateVrTracking;
// pub const SetVrConfiguration = lib.SetVrConfiguration;
// pub const IsVrSimulatorReady = lib.IsVrSimulatorReady;
// pub const ToggleVrMode = lib.ToggleVrMode;
// pub const BeginVrDrawing = lib.BeginVrDrawing;
// pub const EndVrDrawing = lib.EndVrDrawing;

// // Audio device management functions
// pub const InitAudioDevice = lib.InitAudioDevice;
// pub const CloseAudioDevice = lib.CloseAudioDevice;
// pub const IsAudioDeviceReady = lib.IsAudioDeviceReady;
// pub const SetMasterVolume = lib.SetMasterVolume;

//     // Wave/Sound loading/unloading functions
// pub const LoadWave = lib.LoadWave;
// pub const LoadWaveEx = lib.LoadWaveEx;
// pub const LoadSound = lib.LoadSound;
// pub const LoadSoundFromWave = lib.LoadSoundFromWave;
// pub const UpdateSound = lib.UpdateSound;
// pub const UnloadWave = lib.UnloadWave;
// pub const UnloadSound = lib.UnloadSound;
// pub const ExportWave = lib.ExportWave;
// pub const ExportWaveAsCode = lib.ExportWaveAsCode;

//     // Wave/Sound management functions
// pub const PlaySound = lib.PlaySound;
// pub const PauseSound = lib.PauseSound;
// pub const ResumeSound = lib.ResumeSound;
// pub const StopSound = lib.StopSound;
// pub const IsSoundPlaying = lib.IsSoundPlaying;
// pub const SetSoundVolume = lib.SetSoundVolume;
// pub const SetSoundPitch = lib.SetSoundPitch;
// pub const WaveFormat = lib.WaveFormat;
// pub const WaveCopy = lib.WaveCopy;
// pub const WaveCrop = lib.WaveCrop;
// pub const GetWaveData = lib.GetWaveData;

//     // Music management functions
// pub const LoadMusicStream = lib.LoadMusicStream;
// pub const UnloadMusicStream = lib.UnloadMusicStream;
// pub const PlayMusicStream = lib.PlayMusicStream;
// pub const UpdateMusicStream = lib.UpdateMusicStream;
// pub const StopMusicStream = lib.StopMusicStream;
// pub const PauseMusicStream = lib.PauseMusicStream;
// pub const ResumeMusicStream = lib.ResumeMusicStream;
// pub const IsMusicPlaying = lib.IsMusicPlaying;
// pub const SetMusicVolume = lib.SetMusicVolume;
// pub const SetMusicPitch = lib.SetMusicPitch;
// pub const SetMusicLoopCount = lib.SetMusicLoopCount;
// pub const GetMusicTimeLength = lib.GetMusicTimeLength;
// pub const GetMusicTimePlayed = lib.GetMusicTimePlayed;

//     // AudioStream management functions
// pub const InitAudioStream = lib.InitAudioStream;
// pub const UpdateAudioStream = lib.UpdateAudioStream;
// pub const CloseAudioStream = lib.CloseAudioStream;
// pub const IsAudioBufferProcessed = lib.IsAudioBufferProcessed;
// pub const PlayAudioStream = lib.PlayAudioStream;
// pub const PauseAudioStream = lib.PauseAudioStream;
// pub const ResumeAudioStream = lib.ResumeAudioStream;
// pub const IsAudioStreamPlaying = lib.IsAudioStreamPlaying;
// pub const StopAudioStream = lib.StopAudioStream;
// pub const SetAudioStreamVolume = lib.SetAudioStreamVolume;
// pub const SetAudioStreamPitch = lib.SetAudioStreamPitch;


// pub const Vector2 = lib.Vector2;
// pub const Vector3 = lib.Vector3;
// pub const Vector4 = lib.Vector4;
// pub const Quaternion = lib.Quaternion;
// pub const Matrix = lib.Matrix;
// pub const Color = lib.Color;
// pub const Rectangle = lib.Rectangle;
    
// pub const Image = lib.Image;



// pub const Texture = lib.Texture;

// pub const RenderTexture = lib.RenderTexture;
// pub const NPatchInfo = lib.NPatchInfo;
// pub const CharInfo = lib.CharInfo;
// pub const Font = lib.Font;

// pub const Camera = lib.Camera;
// pub const Camera2D = lib.Camera2D;
// pub const Mesh = lib.Mesh;
// pub const Shader = lib.Shader;
// pub const MaterialMap = lib.MaterialMap;
// pub const Material = lib.Material;
// pub const Model = lib.Model;
// pub const Transform = lib.Transform;
// pub const BoneInfo = lib.BoneInfo;
// pub const ModelAnimation = lib.ModelAnimation;
// pub const Ray = lib.Ray;
// pub const RayHitInfo = lib.RayHitInfo;
// pub const BoundingBox = lib.BoundingBox;

// pub const Wave = lib.Wave;
// pub const Sound = lib.Sound;
// pub const Music = lib.Music;
// pub const AudioStream = lib.AudioStream;

// pub const VrDeviceInfo = lib.VrDeviceInfo;
