// use @cImport({ @cInclude("raylib.h"); });

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

pub const LIGHTGRAY  = CLiteral(200, 200, 200, 255);   // Light Gray
pub const GRAY       = CLiteral(130, 130, 130, 255);   // Gray
pub const DARKGRAY   = CLiteral(80, 80, 80, 255);      // Dark Gray
pub const YELLOW     = CLiteral(253, 249, 0, 255);     // Yellow
pub const GOLD       = CLiteral(255, 203, 0, 255);     // Gold
pub const ORANGE     = CLiteral(255, 161, 0, 255);     // Orange
pub const PINK       = CLiteral(255, 109, 194, 255);   // Pink
pub const RED        = CLiteral(230, 41, 55, 255);     // Red
pub const MAROON     = CLiteral(190, 33, 55, 255);     // Maroon
pub const GREEN      = CLiteral(0, 228, 48, 255);      // Green
pub const LIME       = CLiteral(0, 158, 47, 255);      // Lime
pub const DARKGREEN  = CLiteral(0, 117, 44, 255);      // Dark Green
pub const SKYBLUE    = CLiteral(102, 191, 255, 255);   // Sky Blue
pub const BLUE       = CLiteral(0, 121, 241, 255);     // Blue
pub const DARKBLUE   = CLiteral(0, 82, 172, 255);      // Dark Blue
pub const PURPLE     = CLiteral(200, 122, 255, 255);   // Purple
pub const VIOLET     = CLiteral(135, 60, 190, 255);    // Violet
pub const DARKPURPLE = CLiteral(112, 31, 126, 255);    // Dark Purple
pub const BEIGE      = CLiteral(211, 176, 131, 255);   // Beige
pub const BROWN      = CLiteral(127, 106, 79, 255);    // Brown
pub const DARKBROWN  = CLiteral(76, 63, 47, 255);      // Dark Brown
                       
pub const WHITE      = CLiteral(255, 255, 255, 255);   // White
pub const BLACK      = CLiteral(0, 0, 0, 255);         // Black
pub const BLANK      = CLiteral(0, 0, 0, 0);           // Blank (Transparent)
pub const MAGENTA    = CLiteral(255, 0, 255, 255);     // Magenta
pub const RAYWHITE   = CLiteral(245, 245, 245, 255);   // My own White (raylib logo)



pub fn CheckCollisionRecs(rec1: Rectangle, rec2: Rectangle)
bool {
    return
        (rec1.x <= (rec2.x + rec2.width) and
        (rec1.x + rec1.width) >= rec2.x) and
        (rec1.y <= (rec2.y + rec2.height) and
        (rec1.y + rec1.height) >= rec2.y);
}





















// from cInclude
pub const struct___va_list_tag = extern struct {
    gp_offset: c_uint,
    fp_offset: c_uint,
    overflow_arg_area: ?*c_void,
    reg_save_area: ?*c_void,
};
pub const __builtin_va_list = [1]struct___va_list_tag;
pub const va_list = __builtin_va_list;
pub const __gnuc_va_list = __builtin_va_list;
pub const struct_Vector2 = extern struct {
    x: f32,
    y: f32,
};
pub const Vector2 = struct_Vector2;
pub const struct_Vector3 = extern struct {
    x: f32,
    y: f32,
    z: f32,
};
pub const Vector3 = struct_Vector3;
pub const struct_Vector4 = extern struct {
    x: f32,
    y: f32,
    z: f32,
    w: f32,
};
pub const Vector4 = struct_Vector4;
pub const Quaternion = Vector4;
pub const struct_Matrix = extern struct {
    m0: f32,
    m4: f32,
    m8: f32,
    m12: f32,
    m1: f32,
    m5: f32,
    m9: f32,
    m13: f32,
    m2: f32,
    m6: f32,
    m10: f32,
    m14: f32,
    m3: f32,
    m7: f32,
    m11: f32,
    m15: f32,
};
pub const Matrix = struct_Matrix;
pub const struct_Color = extern struct {
    r: u8,
    g: u8,
    b: u8,
    a: u8,
};
pub const Color = struct_Color;
pub const Rectangle = struct {
    x: f32,
    y: f32,
    width: f32,
    height: f32,
};
// pub const Rectangle = struct_Rectangle;
pub const struct_Image = extern struct {
    data: ?*c_void,
    width: c_int,
    height: c_int,
    mipmaps: c_int,
    format: c_int,
};
pub const Image = struct_Image;
pub const struct_Texture2D = extern struct {
    id: c_uint,
    width: c_int,
    height: c_int,
    mipmaps: c_int,
    format: c_int,
};
pub const Texture2D = struct_Texture2D;
pub const Texture = Texture2D;
pub const TextureCubemap = Texture2D;
pub const struct_RenderTexture2D = extern struct {
    id: c_uint,
    texture: Texture2D,
    depth: Texture2D,
    depthTexture: bool,
};
pub const RenderTexture2D = struct_RenderTexture2D;
pub const RenderTexture = RenderTexture2D;
pub const struct_NPatchInfo = extern struct {
    sourceRec: Rectangle,
    left: c_int,
    top: c_int,
    right: c_int,
    bottom: c_int,
    type: c_int,
};
pub const NPatchInfo = struct_NPatchInfo;
pub const struct_CharInfo = extern struct {
    value: c_int,
    rec: Rectangle,
    offsetX: c_int,
    offsetY: c_int,
    advanceX: c_int,
    data: [*c]u8,
};
pub const CharInfo = struct_CharInfo;
pub const struct_Font = extern struct {
    texture: Texture2D,
    baseSize: c_int,
    charsCount: c_int,
    chars: [*c]CharInfo,
};
pub const Font = struct_Font;
pub const struct_Camera3D = extern struct {
    position: Vector3,
    target: Vector3,
    up: Vector3,
    fovy: f32,
    type: c_int,
};
pub const Camera3D = struct_Camera3D;
pub const Camera = Camera3D;
pub const struct_Camera2D = extern struct {
    offset: Vector2,
    target: Vector2,
    rotation: f32,
    zoom: f32,
};
pub const Camera2D = struct_Camera2D;
pub const struct_Mesh = extern struct {
    vertexCount: c_int,
    triangleCount: c_int,
    vertices: [*c]f32,
    texcoords: [*c]f32,
    texcoords2: [*c]f32,
    normals: [*c]f32,
    tangents: [*c]f32,
    colors: [*c]u8,
    indices: [*c]c_ushort,
    animVertices: [*c]f32,
    animNormals: [*c]f32,
    boneIds: [*c]c_int,
    boneWeights: [*c]f32,
    vaoId: c_uint,
    vboId: [7]c_uint,
};
pub const Mesh = struct_Mesh;
pub const struct_Shader = extern struct {
    id: c_uint,
    locs: [32]c_int,
};
pub const Shader = struct_Shader;
pub const struct_MaterialMap = extern struct {
    texture: Texture2D,
    color: Color,
    value: f32,
};
pub const MaterialMap = struct_MaterialMap;
pub const struct_Material = extern struct {
    shader: Shader,
    maps: [12]MaterialMap,
    params: [*c]f32,
};
pub const Material = struct_Material;
pub const struct_Transform = extern struct {
    translation: Vector3,
    rotation: Quaternion,
    scale: Vector3,
};
pub const Transform = struct_Transform;
pub const struct_BoneInfo = extern struct {
    name: [32]u8,
    parent: c_int,
};
pub const BoneInfo = struct_BoneInfo;
pub const struct_Model = extern struct {
    transform: Matrix,
    meshCount: c_int,
    meshes: [*c]Mesh,
    materialCount: c_int,
    materials: [*c]Material,
    meshMaterial: [*c]c_int,
    boneCount: c_int,
    bones: [*c]BoneInfo,
    bindPose: [*c]Transform,
};
pub const Model = struct_Model;
pub const struct_ModelAnimation = extern struct {
    boneCount: c_int,
    bones: [*c]BoneInfo,
    frameCount: c_int,
    framePoses: [*c]([*c]Transform),
};
pub const ModelAnimation = struct_ModelAnimation;
pub const struct_Ray = extern struct {
    position: Vector3,
    direction: Vector3,
};
pub const Ray = struct_Ray;
pub const struct_RayHitInfo = extern struct {
    hit: bool,
    distance: f32,
    position: Vector3,
    normal: Vector3,
};
pub const RayHitInfo = struct_RayHitInfo;
pub const struct_BoundingBox = extern struct {
    min: Vector3,
    max: Vector3,
};
pub const BoundingBox = struct_BoundingBox;
pub const struct_Wave = extern struct {
    sampleCount: c_uint,
    sampleRate: c_uint,
    sampleSize: c_uint,
    channels: c_uint,
    data: ?*c_void,
};
pub const Wave = struct_Wave;
pub const struct_Sound = extern struct {
    audioBuffer: ?*c_void,
    source: c_uint,
    buffer: c_uint,
    format: c_int,
};
pub const Sound = struct_Sound;
pub const struct_MusicData = @OpaqueType();
pub const Music = ?*struct_MusicData;
pub const struct_AudioStream = extern struct {
    sampleRate: c_uint,
    sampleSize: c_uint,
    channels: c_uint,
    audioBuffer: ?*c_void,
    format: c_int,
    source: c_uint,
    buffers: [2]c_uint,
};
pub const AudioStream = struct_AudioStream;
pub const struct_VrDeviceInfo = extern struct {
    hResolution: c_int,
    vResolution: c_int,
    hScreenSize: f32,
    vScreenSize: f32,
    vScreenCenter: f32,
    eyeToScreenDistance: f32,
    lensSeparationDistance: f32,
    interpupillaryDistance: f32,
    lensDistortionValues: [4]f32,
    chromaAbCorrection: [4]f32,
};
pub const VrDeviceInfo = struct_VrDeviceInfo;
pub const FLAG_SHOW_LOGO = 1;
pub const FLAG_FULLSCREEN_MODE = 2;
pub const FLAG_WINDOW_RESIZABLE = 4;
pub const FLAG_WINDOW_UNDECORATED = 8;
pub const FLAG_WINDOW_TRANSPARENT = 16;
pub const FLAG_WINDOW_HIDDEN = 128;
pub const FLAG_MSAA_4X_HINT = 32;
pub const FLAG_VSYNC_HINT = 64;
pub const ConfigFlag = extern enum {
    FLAG_SHOW_LOGO = 1,
    FLAG_FULLSCREEN_MODE = 2,
    FLAG_WINDOW_RESIZABLE = 4,
    FLAG_WINDOW_UNDECORATED = 8,
    FLAG_WINDOW_TRANSPARENT = 16,
    FLAG_WINDOW_HIDDEN = 128,
    FLAG_MSAA_4X_HINT = 32,
    FLAG_VSYNC_HINT = 64,
};
pub const LOG_ALL = 0;
pub const LOG_TRACE = 1;
pub const LOG_DEBUG = 2;
pub const LOG_INFO = 3;
pub const LOG_WARNING = 4;
pub const LOG_ERROR = 5;
pub const LOG_FATAL = 6;
pub const LOG_NONE = 7;
pub const TraceLogType = extern enum {
    LOG_ALL = 0,
    LOG_TRACE = 1,
    LOG_DEBUG = 2,
    LOG_INFO = 3,
    LOG_WARNING = 4,
    LOG_ERROR = 5,
    LOG_FATAL = 6,
    LOG_NONE = 7,
};
pub const KEY_APOSTROPHE = 39;
pub const KEY_COMMA = 44;
pub const KEY_MINUS = 45;
pub const KEY_PERIOD = 46;
pub const KEY_SLASH = 47;
pub const KEY_ZERO = 48;
pub const KEY_ONE = 49;
pub const KEY_TWO = 50;
pub const KEY_THREE = 51;
pub const KEY_FOUR = 52;
pub const KEY_FIVE = 53;
pub const KEY_SIX = 54;
pub const KEY_SEVEN = 55;
pub const KEY_EIGHT = 56;
pub const KEY_NINE = 57;
pub const KEY_SEMICOLON = 59;
pub const KEY_EQUAL = 61;
pub const KEY_A = 65;
pub const KEY_B = 66;
pub const KEY_C = 67;
pub const KEY_D = 68;
pub const KEY_E = 69;
pub const KEY_F = 70;
pub const KEY_G = 71;
pub const KEY_H = 72;
pub const KEY_I = 73;
pub const KEY_J = 74;
pub const KEY_K = 75;
pub const KEY_L = 76;
pub const KEY_M = 77;
pub const KEY_N = 78;
pub const KEY_O = 79;
pub const KEY_P = 80;
pub const KEY_Q = 81;
pub const KEY_R = 82;
pub const KEY_S = 83;
pub const KEY_T = 84;
pub const KEY_U = 85;
pub const KEY_V = 86;
pub const KEY_W = 87;
pub const KEY_X = 88;
pub const KEY_Y = 89;
pub const KEY_Z = 90;
pub const KEY_SPACE = 32;
pub const KEY_ESCAPE = 256;
pub const KEY_ENTER = 257;
pub const KEY_TAB = 258;
pub const KEY_BACKSPACE = 259;
pub const KEY_INSERT = 260;
pub const KEY_DELETE = 261;
pub const KEY_RIGHT = 262;
pub const KEY_LEFT = 263;
pub const KEY_DOWN = 264;
pub const KEY_UP = 265;
pub const KEY_PAGE_UP = 266;
pub const KEY_PAGE_DOWN = 267;
pub const KEY_HOME = 268;
pub const KEY_END = 269;
pub const KEY_CAPS_LOCK = 280;
pub const KEY_SCROLL_LOCK = 281;
pub const KEY_NUM_LOCK = 282;
pub const KEY_PRINT_SCREEN = 283;
pub const KEY_PAUSE = 284;
pub const KEY_F1 = 290;
pub const KEY_F2 = 291;
pub const KEY_F3 = 292;
pub const KEY_F4 = 293;
pub const KEY_F5 = 294;
pub const KEY_F6 = 295;
pub const KEY_F7 = 296;
pub const KEY_F8 = 297;
pub const KEY_F9 = 298;
pub const KEY_F10 = 299;
pub const KEY_F11 = 300;
pub const KEY_F12 = 301;
pub const KEY_LEFT_SHIFT = 340;
pub const KEY_LEFT_CONTROL = 341;
pub const KEY_LEFT_ALT = 342;
pub const KEY_LEFT_SUPER = 343;
pub const KEY_RIGHT_SHIFT = 344;
pub const KEY_RIGHT_CONTROL = 345;
pub const KEY_RIGHT_ALT = 346;
pub const KEY_RIGHT_SUPER = 347;
pub const KEY_KB_MENU = 348;
pub const KEY_LEFT_BRACKET = 91;
pub const KEY_BACKSLASH = 92;
pub const KEY_RIGHT_BRACKET = 93;
pub const KEY_GRAVE = 96;
pub const KEY_KP_0 = 320;
pub const KEY_KP_1 = 321;
pub const KEY_KP_2 = 322;
pub const KEY_KP_3 = 323;
pub const KEY_KP_4 = 324;
pub const KEY_KP_5 = 325;
pub const KEY_KP_6 = 326;
pub const KEY_KP_7 = 327;
pub const KEY_KP_8 = 328;
pub const KEY_KP_9 = 329;
pub const KEY_KP_DECIMAL = 330;
pub const KEY_KP_DIVIDE = 331;
pub const KEY_KP_MULTIPLY = 332;
pub const KEY_KP_SUBTRACT = 333;
pub const KEY_KP_ADD = 334;
pub const KEY_KP_ENTER = 335;
pub const KEY_KP_EQUAL = 336;
pub const KeyboardKey = extern enum {
    KEY_APOSTROPHE = 39,
    KEY_COMMA = 44,
    KEY_MINUS = 45,
    KEY_PERIOD = 46,
    KEY_SLASH = 47,
    KEY_ZERO = 48,
    KEY_ONE = 49,
    KEY_TWO = 50,
    KEY_THREE = 51,
    KEY_FOUR = 52,
    KEY_FIVE = 53,
    KEY_SIX = 54,
    KEY_SEVEN = 55,
    KEY_EIGHT = 56,
    KEY_NINE = 57,
    KEY_SEMICOLON = 59,
    KEY_EQUAL = 61,
    KEY_A = 65,
    KEY_B = 66,
    KEY_C = 67,
    KEY_D = 68,
    KEY_E = 69,
    KEY_F = 70,
    KEY_G = 71,
    KEY_H = 72,
    KEY_I = 73,
    KEY_J = 74,
    KEY_K = 75,
    KEY_L = 76,
    KEY_M = 77,
    KEY_N = 78,
    KEY_O = 79,
    KEY_P = 80,
    KEY_Q = 81,
    KEY_R = 82,
    KEY_S = 83,
    KEY_T = 84,
    KEY_U = 85,
    KEY_V = 86,
    KEY_W = 87,
    KEY_X = 88,
    KEY_Y = 89,
    KEY_Z = 90,
    KEY_SPACE = 32,
    KEY_ESCAPE = 256,
    KEY_ENTER = 257,
    KEY_TAB = 258,
    KEY_BACKSPACE = 259,
    KEY_INSERT = 260,
    KEY_DELETE = 261,
    KEY_RIGHT = 262,
    KEY_LEFT = 263,
    KEY_DOWN = 264,
    KEY_UP = 265,
    KEY_PAGE_UP = 266,
    KEY_PAGE_DOWN = 267,
    KEY_HOME = 268,
    KEY_END = 269,
    KEY_CAPS_LOCK = 280,
    KEY_SCROLL_LOCK = 281,
    KEY_NUM_LOCK = 282,
    KEY_PRINT_SCREEN = 283,
    KEY_PAUSE = 284,
    KEY_F1 = 290,
    KEY_F2 = 291,
    KEY_F3 = 292,
    KEY_F4 = 293,
    KEY_F5 = 294,
    KEY_F6 = 295,
    KEY_F7 = 296,
    KEY_F8 = 297,
    KEY_F9 = 298,
    KEY_F10 = 299,
    KEY_F11 = 300,
    KEY_F12 = 301,
    KEY_LEFT_SHIFT = 340,
    KEY_LEFT_CONTROL = 341,
    KEY_LEFT_ALT = 342,
    KEY_LEFT_SUPER = 343,
    KEY_RIGHT_SHIFT = 344,
    KEY_RIGHT_CONTROL = 345,
    KEY_RIGHT_ALT = 346,
    KEY_RIGHT_SUPER = 347,
    KEY_KB_MENU = 348,
    KEY_LEFT_BRACKET = 91,
    KEY_BACKSLASH = 92,
    KEY_RIGHT_BRACKET = 93,
    KEY_GRAVE = 96,
    KEY_KP_0 = 320,
    KEY_KP_1 = 321,
    KEY_KP_2 = 322,
    KEY_KP_3 = 323,
    KEY_KP_4 = 324,
    KEY_KP_5 = 325,
    KEY_KP_6 = 326,
    KEY_KP_7 = 327,
    KEY_KP_8 = 328,
    KEY_KP_9 = 329,
    KEY_KP_DECIMAL = 330,
    KEY_KP_DIVIDE = 331,
    KEY_KP_MULTIPLY = 332,
    KEY_KP_SUBTRACT = 333,
    KEY_KP_ADD = 334,
    KEY_KP_ENTER = 335,
    KEY_KP_EQUAL = 336,
};
pub const KEY_BACK = 4;
pub const KEY_MENU = 82;
pub const KEY_VOLUME_UP = 24;
pub const KEY_VOLUME_DOWN = 25;
pub const AndroidButton = extern enum {
    KEY_BACK = 4,
    KEY_MENU = 82,
    KEY_VOLUME_UP = 24,
    KEY_VOLUME_DOWN = 25,
};
pub const MOUSE_LEFT_BUTTON = 0;
pub const MOUSE_RIGHT_BUTTON = 1;
pub const MOUSE_MIDDLE_BUTTON = 2;
pub const MouseButton = extern enum {
    MOUSE_LEFT_BUTTON = 0,
    MOUSE_RIGHT_BUTTON = 1,
    MOUSE_MIDDLE_BUTTON = 2,
};
pub const GAMEPAD_PLAYER1 = 0;
pub const GAMEPAD_PLAYER2 = 1;
pub const GAMEPAD_PLAYER3 = 2;
pub const GAMEPAD_PLAYER4 = 3;
pub const GamepadNumber = extern enum {
    GAMEPAD_PLAYER1 = 0,
    GAMEPAD_PLAYER2 = 1,
    GAMEPAD_PLAYER3 = 2,
    GAMEPAD_PLAYER4 = 3,
};
pub const GAMEPAD_BUTTON_UNKNOWN = 0;
pub const GAMEPAD_BUTTON_LEFT_FACE_UP = 1;
pub const GAMEPAD_BUTTON_LEFT_FACE_RIGHT = 2;
pub const GAMEPAD_BUTTON_LEFT_FACE_DOWN = 3;
pub const GAMEPAD_BUTTON_LEFT_FACE_LEFT = 4;
pub const GAMEPAD_BUTTON_RIGHT_FACE_UP = 5;
pub const GAMEPAD_BUTTON_RIGHT_FACE_RIGHT = 6;
pub const GAMEPAD_BUTTON_RIGHT_FACE_DOWN = 7;
pub const GAMEPAD_BUTTON_RIGHT_FACE_LEFT = 8;
pub const GAMEPAD_BUTTON_LEFT_TRIGGER_1 = 9;
pub const GAMEPAD_BUTTON_LEFT_TRIGGER_2 = 10;
pub const GAMEPAD_BUTTON_RIGHT_TRIGGER_1 = 11;
pub const GAMEPAD_BUTTON_RIGHT_TRIGGER_2 = 12;
pub const GAMEPAD_BUTTON_MIDDLE_LEFT = 13;
pub const GAMEPAD_BUTTON_MIDDLE = 14;
pub const GAMEPAD_BUTTON_MIDDLE_RIGHT = 15;
pub const GAMEPAD_BUTTON_LEFT_THUMB = 16;
pub const GAMEPAD_BUTTON_RIGHT_THUMB = 17;
pub const GamepadButton = extern enum {
    GAMEPAD_BUTTON_UNKNOWN = 0,
    GAMEPAD_BUTTON_LEFT_FACE_UP = 1,
    GAMEPAD_BUTTON_LEFT_FACE_RIGHT = 2,
    GAMEPAD_BUTTON_LEFT_FACE_DOWN = 3,
    GAMEPAD_BUTTON_LEFT_FACE_LEFT = 4,
    GAMEPAD_BUTTON_RIGHT_FACE_UP = 5,
    GAMEPAD_BUTTON_RIGHT_FACE_RIGHT = 6,
    GAMEPAD_BUTTON_RIGHT_FACE_DOWN = 7,
    GAMEPAD_BUTTON_RIGHT_FACE_LEFT = 8,
    GAMEPAD_BUTTON_LEFT_TRIGGER_1 = 9,
    GAMEPAD_BUTTON_LEFT_TRIGGER_2 = 10,
    GAMEPAD_BUTTON_RIGHT_TRIGGER_1 = 11,
    GAMEPAD_BUTTON_RIGHT_TRIGGER_2 = 12,
    GAMEPAD_BUTTON_MIDDLE_LEFT = 13,
    GAMEPAD_BUTTON_MIDDLE = 14,
    GAMEPAD_BUTTON_MIDDLE_RIGHT = 15,
    GAMEPAD_BUTTON_LEFT_THUMB = 16,
    GAMEPAD_BUTTON_RIGHT_THUMB = 17,
};
pub const GAMEPAD_AXIS_UNKNOWN = 0;
pub const GAMEPAD_AXIS_LEFT_X = 1;
pub const GAMEPAD_AXIS_LEFT_Y = 2;
pub const GAMEPAD_AXIS_RIGHT_X = 3;
pub const GAMEPAD_AXIS_RIGHT_Y = 4;
pub const GAMEPAD_AXIS_LEFT_TRIGGER = 5;
pub const GAMEPAD_AXIS_RIGHT_TRIGGER = 6;
pub const GamepadAxis = extern enum {
    GAMEPAD_AXIS_UNKNOWN = 0,
    GAMEPAD_AXIS_LEFT_X = 1,
    GAMEPAD_AXIS_LEFT_Y = 2,
    GAMEPAD_AXIS_RIGHT_X = 3,
    GAMEPAD_AXIS_RIGHT_Y = 4,
    GAMEPAD_AXIS_LEFT_TRIGGER = 5,
    GAMEPAD_AXIS_RIGHT_TRIGGER = 6,
};
pub const LOC_VERTEX_POSITION = 0;
pub const LOC_VERTEX_TEXCOORD01 = 1;
pub const LOC_VERTEX_TEXCOORD02 = 2;
pub const LOC_VERTEX_NORMAL = 3;
pub const LOC_VERTEX_TANGENT = 4;
pub const LOC_VERTEX_COLOR = 5;
pub const LOC_MATRIX_MVP = 6;
pub const LOC_MATRIX_MODEL = 7;
pub const LOC_MATRIX_VIEW = 8;
pub const LOC_MATRIX_PROJECTION = 9;
pub const LOC_VECTOR_VIEW = 10;
pub const LOC_COLOR_DIFFUSE = 11;
pub const LOC_COLOR_SPECULAR = 12;
pub const LOC_COLOR_AMBIENT = 13;
pub const LOC_MAP_ALBEDO = 14;
pub const LOC_MAP_METALNESS = 15;
pub const LOC_MAP_NORMAL = 16;
pub const LOC_MAP_ROUGHNESS = 17;
pub const LOC_MAP_OCCLUSION = 18;
pub const LOC_MAP_EMISSION = 19;
pub const LOC_MAP_HEIGHT = 20;
pub const LOC_MAP_CUBEMAP = 21;
pub const LOC_MAP_IRRADIANCE = 22;
pub const LOC_MAP_PREFILTER = 23;
pub const LOC_MAP_BRDF = 24;
pub const ShaderLocationIndex = extern enum {
    LOC_VERTEX_POSITION = 0,
    LOC_VERTEX_TEXCOORD01 = 1,
    LOC_VERTEX_TEXCOORD02 = 2,
    LOC_VERTEX_NORMAL = 3,
    LOC_VERTEX_TANGENT = 4,
    LOC_VERTEX_COLOR = 5,
    LOC_MATRIX_MVP = 6,
    LOC_MATRIX_MODEL = 7,
    LOC_MATRIX_VIEW = 8,
    LOC_MATRIX_PROJECTION = 9,
    LOC_VECTOR_VIEW = 10,
    LOC_COLOR_DIFFUSE = 11,
    LOC_COLOR_SPECULAR = 12,
    LOC_COLOR_AMBIENT = 13,
    LOC_MAP_ALBEDO = 14,
    LOC_MAP_METALNESS = 15,
    LOC_MAP_NORMAL = 16,
    LOC_MAP_ROUGHNESS = 17,
    LOC_MAP_OCCLUSION = 18,
    LOC_MAP_EMISSION = 19,
    LOC_MAP_HEIGHT = 20,
    LOC_MAP_CUBEMAP = 21,
    LOC_MAP_IRRADIANCE = 22,
    LOC_MAP_PREFILTER = 23,
    LOC_MAP_BRDF = 24,
};
pub const UNIFORM_FLOAT = 0;
pub const UNIFORM_VEC2 = 1;
pub const UNIFORM_VEC3 = 2;
pub const UNIFORM_VEC4 = 3;
pub const UNIFORM_INT = 4;
pub const UNIFORM_IVEC2 = 5;
pub const UNIFORM_IVEC3 = 6;
pub const UNIFORM_IVEC4 = 7;
pub const UNIFORM_SAMPLER2D = 8;
pub const ShaderUniformDataType = extern enum {
    UNIFORM_FLOAT = 0,
    UNIFORM_VEC2 = 1,
    UNIFORM_VEC3 = 2,
    UNIFORM_VEC4 = 3,
    UNIFORM_INT = 4,
    UNIFORM_IVEC2 = 5,
    UNIFORM_IVEC3 = 6,
    UNIFORM_IVEC4 = 7,
    UNIFORM_SAMPLER2D = 8,
};
pub const MAP_ALBEDO = 0;
pub const MAP_METALNESS = 1;
pub const MAP_NORMAL = 2;
pub const MAP_ROUGHNESS = 3;
pub const MAP_OCCLUSION = 4;
pub const MAP_EMISSION = 5;
pub const MAP_HEIGHT = 6;
pub const MAP_CUBEMAP = 7;
pub const MAP_IRRADIANCE = 8;
pub const MAP_PREFILTER = 9;
pub const MAP_BRDF = 10;
pub const MaterialMapType = extern enum {
    MAP_ALBEDO = 0,
    MAP_METALNESS = 1,
    MAP_NORMAL = 2,
    MAP_ROUGHNESS = 3,
    MAP_OCCLUSION = 4,
    MAP_EMISSION = 5,
    MAP_HEIGHT = 6,
    MAP_CUBEMAP = 7,
    MAP_IRRADIANCE = 8,
    MAP_PREFILTER = 9,
    MAP_BRDF = 10,
};
pub const UNCOMPRESSED_GRAYSCALE = 1;
pub const UNCOMPRESSED_GRAY_ALPHA = 2;
pub const UNCOMPRESSED_R5G6B5 = 3;
pub const UNCOMPRESSED_R8G8B8 = 4;
pub const UNCOMPRESSED_R5G5B5A1 = 5;
pub const UNCOMPRESSED_R4G4B4A4 = 6;
pub const UNCOMPRESSED_R8G8B8A8 = 7;
pub const UNCOMPRESSED_R32 = 8;
pub const UNCOMPRESSED_R32G32B32 = 9;
pub const UNCOMPRESSED_R32G32B32A32 = 10;
pub const COMPRESSED_DXT1_RGB = 11;
pub const COMPRESSED_DXT1_RGBA = 12;
pub const COMPRESSED_DXT3_RGBA = 13;
pub const COMPRESSED_DXT5_RGBA = 14;
pub const COMPRESSED_ETC1_RGB = 15;
pub const COMPRESSED_ETC2_RGB = 16;
pub const COMPRESSED_ETC2_EAC_RGBA = 17;
pub const COMPRESSED_PVRT_RGB = 18;
pub const COMPRESSED_PVRT_RGBA = 19;
pub const COMPRESSED_ASTC_4x4_RGBA = 20;
pub const COMPRESSED_ASTC_8x8_RGBA = 21;
pub const PixelFormat = extern enum {
    UNCOMPRESSED_GRAYSCALE = 1,
    UNCOMPRESSED_GRAY_ALPHA = 2,
    UNCOMPRESSED_R5G6B5 = 3,
    UNCOMPRESSED_R8G8B8 = 4,
    UNCOMPRESSED_R5G5B5A1 = 5,
    UNCOMPRESSED_R4G4B4A4 = 6,
    UNCOMPRESSED_R8G8B8A8 = 7,
    UNCOMPRESSED_R32 = 8,
    UNCOMPRESSED_R32G32B32 = 9,
    UNCOMPRESSED_R32G32B32A32 = 10,
    COMPRESSED_DXT1_RGB = 11,
    COMPRESSED_DXT1_RGBA = 12,
    COMPRESSED_DXT3_RGBA = 13,
    COMPRESSED_DXT5_RGBA = 14,
    COMPRESSED_ETC1_RGB = 15,
    COMPRESSED_ETC2_RGB = 16,
    COMPRESSED_ETC2_EAC_RGBA = 17,
    COMPRESSED_PVRT_RGB = 18,
    COMPRESSED_PVRT_RGBA = 19,
    COMPRESSED_ASTC_4x4_RGBA = 20,
    COMPRESSED_ASTC_8x8_RGBA = 21,
};
pub const FILTER_POINT = 0;
pub const FILTER_BILINEAR = 1;
pub const FILTER_TRILINEAR = 2;
pub const FILTER_ANISOTROPIC_4X = 3;
pub const FILTER_ANISOTROPIC_8X = 4;
pub const FILTER_ANISOTROPIC_16X = 5;
pub const TextureFilterMode = extern enum {
    FILTER_POINT = 0,
    FILTER_BILINEAR = 1,
    FILTER_TRILINEAR = 2,
    FILTER_ANISOTROPIC_4X = 3,
    FILTER_ANISOTROPIC_8X = 4,
    FILTER_ANISOTROPIC_16X = 5,
};
pub const CUBEMAP_AUTO_DETECT = 0;
pub const CUBEMAP_LINE_VERTICAL = 1;
pub const CUBEMAP_LINE_HORIZONTAL = 2;
pub const CUBEMAP_CROSS_THREE_BY_FOUR = 3;
pub const CUBEMAP_CROSS_FOUR_BY_THREE = 4;
pub const CUBEMAP_PANORAMA = 5;
pub const CubemapLayoutType = extern enum {
    CUBEMAP_AUTO_DETECT = 0,
    CUBEMAP_LINE_VERTICAL = 1,
    CUBEMAP_LINE_HORIZONTAL = 2,
    CUBEMAP_CROSS_THREE_BY_FOUR = 3,
    CUBEMAP_CROSS_FOUR_BY_THREE = 4,
    CUBEMAP_PANORAMA = 5,
};
pub const WRAP_REPEAT = 0;
pub const WRAP_CLAMP = 1;
pub const WRAP_MIRROR_REPEAT = 2;
pub const WRAP_MIRROR_CLAMP = 3;
pub const TextureWrapMode = extern enum {
    WRAP_REPEAT = 0,
    WRAP_CLAMP = 1,
    WRAP_MIRROR_REPEAT = 2,
    WRAP_MIRROR_CLAMP = 3,
};
pub const FONT_DEFAULT = 0;
pub const FONT_BITMAP = 1;
pub const FONT_SDF = 2;
pub const FontType = extern enum {
    FONT_DEFAULT = 0,
    FONT_BITMAP = 1,
    FONT_SDF = 2,
};
pub const BLEND_ALPHA = 0;
pub const BLEND_ADDITIVE = 1;
pub const BLEND_MULTIPLIED = 2;
pub const BlendMode = extern enum {
    BLEND_ALPHA = 0,
    BLEND_ADDITIVE = 1,
    BLEND_MULTIPLIED = 2,
};
pub const GESTURE_NONE = 0;
pub const GESTURE_TAP = 1;
pub const GESTURE_DOUBLETAP = 2;
pub const GESTURE_HOLD = 4;
pub const GESTURE_DRAG = 8;
pub const GESTURE_SWIPE_RIGHT = 16;
pub const GESTURE_SWIPE_LEFT = 32;
pub const GESTURE_SWIPE_UP = 64;
pub const GESTURE_SWIPE_DOWN = 128;
pub const GESTURE_PINCH_IN = 256;
pub const GESTURE_PINCH_OUT = 512;
pub const GestureType = extern enum {
    GESTURE_NONE = 0,
    GESTURE_TAP = 1,
    GESTURE_DOUBLETAP = 2,
    GESTURE_HOLD = 4,
    GESTURE_DRAG = 8,
    GESTURE_SWIPE_RIGHT = 16,
    GESTURE_SWIPE_LEFT = 32,
    GESTURE_SWIPE_UP = 64,
    GESTURE_SWIPE_DOWN = 128,
    GESTURE_PINCH_IN = 256,
    GESTURE_PINCH_OUT = 512,
};
pub const CAMERA_CUSTOM = 0;
pub const CAMERA_FREE = 1;
pub const CAMERA_ORBITAL = 2;
pub const CAMERA_FIRST_PERSON = 3;
pub const CAMERA_THIRD_PERSON = 4;
pub const CameraMode = extern enum {
    CAMERA_CUSTOM = 0,
    CAMERA_FREE = 1,
    CAMERA_ORBITAL = 2,
    CAMERA_FIRST_PERSON = 3,
    CAMERA_THIRD_PERSON = 4,
};
pub const CAMERA_PERSPECTIVE = 0;
pub const CAMERA_ORTHOGRAPHIC = 1;
pub const CameraType = extern enum {
    CAMERA_PERSPECTIVE = 0,
    CAMERA_ORTHOGRAPHIC = 1,
};
pub const NPT_9PATCH = 0;
pub const NPT_3PATCH_VERTICAL = 1;
pub const NPT_3PATCH_HORIZONTAL = 2;
pub const NPatchType = extern enum {
    NPT_9PATCH = 0,
    NPT_3PATCH_VERTICAL = 1,
    NPT_3PATCH_HORIZONTAL = 2,
};
pub const TraceLogCallback = ?extern fn(c_int, [*c]const u8, [*c]struct___va_list_tag) void;
pub extern fn InitWindow(width: c_int, height: c_int, title: [*c]const u8) void;
pub extern fn WindowShouldClose() bool;
pub extern fn CloseWindow() void;
pub extern fn IsWindowReady() bool;
pub extern fn IsWindowMinimized() bool;
pub extern fn IsWindowResized() bool;
pub extern fn IsWindowHidden() bool;
pub extern fn ToggleFullscreen() void;
pub extern fn UnhideWindow() void;
pub extern fn HideWindow() void;
pub extern fn SetWindowIcon(image: Image) void;
pub extern fn SetWindowTitle(title: [*c]const u8) void;
pub extern fn SetWindowPosition(x: c_int, y: c_int) void;
pub extern fn SetWindowMonitor(monitor: c_int) void;
pub extern fn SetWindowMinSize(width: c_int, height: c_int) void;
pub extern fn SetWindowSize(width: c_int, height: c_int) void;
pub extern fn GetWindowHandle() ?*c_void;
pub extern fn GetScreenWidth() c_int;
pub extern fn GetScreenHeight() c_int;
pub extern fn GetMonitorCount() c_int;
pub extern fn GetMonitorWidth(monitor: c_int) c_int;
pub extern fn GetMonitorHeight(monitor: c_int) c_int;
pub extern fn GetMonitorPhysicalWidth(monitor: c_int) c_int;
pub extern fn GetMonitorPhysicalHeight(monitor: c_int) c_int;
pub extern fn GetMonitorName(monitor: c_int) [*c]const u8;
pub extern fn GetClipboardText() [*c]const u8;
pub extern fn SetClipboardText(text: [*c]const u8) void;
pub extern fn ShowCursor() void;
pub extern fn HideCursor() void;
pub extern fn IsCursorHidden() bool;
pub extern fn EnableCursor() void;
pub extern fn DisableCursor() void;
pub extern fn ClearBackground(color: Color) void;
pub extern fn BeginDrawing() void;
pub extern fn EndDrawing() void;
pub extern fn BeginMode2D(camera: Camera2D) void;
pub extern fn EndMode2D() void;
pub extern fn BeginMode3D(camera: Camera3D) void;
pub extern fn EndMode3D() void;
pub extern fn BeginTextureMode(target: RenderTexture2D) void;
pub extern fn EndTextureMode() void;
pub extern fn GetMouseRay(mousePosition: Vector2, camera: Camera) Ray;
pub extern fn GetWorldToScreen(position: Vector3, camera: Camera) Vector2;
pub extern fn GetCameraMatrix(camera: Camera) Matrix;
pub extern fn SetTargetFPS(fps: c_int) void;
pub extern fn GetFPS() c_int;
pub extern fn GetFrameTime() f32;
pub extern fn GetTime() f64;
pub extern fn ColorToInt(color: Color) c_int;
pub extern fn ColorNormalize(color: Color) Vector4;
pub extern fn ColorToHSV(color: Color) Vector3;
pub extern fn ColorFromHSV(hsv: Vector3) Color;
pub extern fn GetColor(hexValue: c_int) Color;
pub extern fn Fade(color: Color, alpha: f32) Color;
pub extern fn SetConfigFlags(flags: u8) void;
pub extern fn SetTraceLogLevel(logType: c_int) void;
pub extern fn SetTraceLogExit(logType: c_int) void;
pub extern fn SetTraceLogCallback(callback: TraceLogCallback) void;
pub extern fn TraceLog(logType: c_int, text: [*c]const u8, ...) void;
pub extern fn TakeScreenshot(fileName: [*c]const u8) void;
pub extern fn GetRandomValue(min: c_int, max: c_int) c_int;
pub extern fn FileExists(fileName: [*c]const u8) bool;
pub extern fn IsFileExtension(fileName: [*c]const u8, ext: [*c]const u8) bool;
pub extern fn GetExtension(fileName: [*c]const u8) [*c]const u8;
pub extern fn GetFileName(filePath: [*c]const u8) [*c]const u8;
pub extern fn GetFileNameWithoutExt(filePath: [*c]const u8) [*c]const u8;
pub extern fn GetDirectoryPath(fileName: [*c]const u8) [*c]const u8;
pub extern fn GetWorkingDirectory() [*c]const u8;
pub extern fn GetDirectoryFiles(dirPath: [*c]const u8, count: [*c]c_int) [*c]([*c]u8);
pub extern fn ClearDirectoryFiles() void;
pub extern fn ChangeDirectory(dir: [*c]const u8) bool;
pub extern fn IsFileDropped() bool;
pub extern fn GetDroppedFiles(count: [*c]c_int) [*c]([*c]u8);
pub extern fn ClearDroppedFiles() void;
pub extern fn GetFileModTime(fileName: [*c]const u8) c_long;
pub extern fn StorageSaveValue(position: c_int, value: c_int) void;
pub extern fn StorageLoadValue(position: c_int) c_int;
pub extern fn OpenURL(url: [*c]const u8) void;
pub extern fn IsKeyPressed(key: c_int) bool;
pub extern fn IsKeyDown(key: c_int) bool;
pub extern fn IsKeyReleased(key: c_int) bool;
pub extern fn IsKeyUp(key: c_int) bool;
pub extern fn GetKeyPressed() c_int;
pub extern fn SetExitKey(key: c_int) void;
pub extern fn IsGamepadAvailable(gamepad: c_int) bool;
pub extern fn IsGamepadName(gamepad: c_int, name: [*c]const u8) bool;
pub extern fn GetGamepadName(gamepad: c_int) [*c]const u8;
pub extern fn IsGamepadButtonPressed(gamepad: c_int, button: c_int) bool;
pub extern fn IsGamepadButtonDown(gamepad: c_int, button: c_int) bool;
pub extern fn IsGamepadButtonReleased(gamepad: c_int, button: c_int) bool;
pub extern fn IsGamepadButtonUp(gamepad: c_int, button: c_int) bool;
pub extern fn GetGamepadButtonPressed() c_int;
pub extern fn GetGamepadAxisCount(gamepad: c_int) c_int;
pub extern fn GetGamepadAxisMovement(gamepad: c_int, axis: c_int) f32;
pub extern fn IsMouseButtonPressed(button: c_int) bool;
pub extern fn IsMouseButtonDown(button: c_int) bool;
pub extern fn IsMouseButtonReleased(button: c_int) bool;
pub extern fn IsMouseButtonUp(button: c_int) bool;
pub extern fn GetMouseX() c_int;
pub extern fn GetMouseY() c_int;
pub extern fn GetMousePosition() Vector2;
pub extern fn SetMousePosition(x: c_int, y: c_int) void;
pub extern fn SetMouseOffset(offsetX: c_int, offsetY: c_int) void;
pub extern fn SetMouseScale(scaleX: f32, scaleY: f32) void;
pub extern fn GetMouseWheelMove() c_int;
pub extern fn GetTouchX() c_int;
pub extern fn GetTouchY() c_int;
pub extern fn GetTouchPosition(index: c_int) Vector2;
pub extern fn SetGesturesEnabled(gestureFlags: c_uint) void;
pub extern fn IsGestureDetected(gesture: c_int) bool;
pub extern fn GetGestureDetected() c_int;
pub extern fn GetTouchPointsCount() c_int;
pub extern fn GetGestureHoldDuration() f32;
pub extern fn GetGestureDragVector() Vector2;
pub extern fn GetGestureDragAngle() f32;
pub extern fn GetGesturePinchVector() Vector2;
pub extern fn GetGesturePinchAngle() f32;
pub extern fn SetCameraMode(camera: Camera, mode: c_int) void;
pub extern fn UpdateCamera(camera: [*c]Camera) void;
pub extern fn SetCameraPanControl(panKey: c_int) void;
pub extern fn SetCameraAltControl(altKey: c_int) void;
pub extern fn SetCameraSmoothZoomControl(szKey: c_int) void;
pub extern fn SetCameraMoveControls(frontKey: c_int, backKey: c_int, rightKey: c_int, leftKey: c_int, upKey: c_int, downKey: c_int) void;
pub extern fn DrawPixel(posX: c_int, posY: c_int, color: Color) void;
pub extern fn DrawPixelV(position: Vector2, color: Color) void;
pub extern fn DrawLine(startPosX: c_int, startPosY: c_int, endPosX: c_int, endPosY: c_int, color: Color) void;
pub extern fn DrawLineV(startPos: Vector2, endPos: Vector2, color: Color) void;
pub extern fn DrawLineEx(startPos: Vector2, endPos: Vector2, thick: f32, color: Color) void;
pub extern fn DrawLineBezier(startPos: Vector2, endPos: Vector2, thick: f32, color: Color) void;
pub extern fn DrawLineStrip(points: [*c]Vector2, numPoints: c_int, color: Color) void;
pub extern fn DrawCircle(centerX: c_int, centerY: c_int, radius: f32, color: Color) void;
pub extern fn DrawCircleSector(center: Vector2, radius: f32, startAngle: c_int, endAngle: c_int, segments: c_int, color: Color) void;
pub extern fn DrawCircleSectorLines(center: Vector2, radius: f32, startAngle: c_int, endAngle: c_int, segments: c_int, color: Color) void;
pub extern fn DrawCircleGradient(centerX: c_int, centerY: c_int, radius: f32, color1: Color, color2: Color) void;
pub extern fn DrawCircleV(center: Vector2, radius: f32, color: Color) void;
pub extern fn DrawCircleLines(centerX: c_int, centerY: c_int, radius: f32, color: Color) void;
pub extern fn DrawRing(center: Vector2, innerRadius: f32, outerRadius: f32, startAngle: c_int, endAngle: c_int, segments: c_int, color: Color) void;
pub extern fn DrawRingLines(center: Vector2, innerRadius: f32, outerRadius: f32, startAngle: c_int, endAngle: c_int, segments: c_int, color: Color) void;
pub extern fn DrawRectangle(posX: c_int, posY: c_int, width: c_int, height: c_int, color: Color) void;
pub extern fn DrawRectangleV(position: Vector2, size: Vector2, color: Color) void;
pub extern fn DrawRectangleRec(rec: Rectangle, color: Color) void;
pub extern fn DrawRectanglePro(rec: Rectangle, origin: Vector2, rotation: f32, color: Color) void;
pub extern fn DrawRectangleGradientV(posX: c_int, posY: c_int, width: c_int, height: c_int, color1: Color, color2: Color) void;
pub extern fn DrawRectangleGradientH(posX: c_int, posY: c_int, width: c_int, height: c_int, color1: Color, color2: Color) void;
pub extern fn DrawRectangleGradientEx(rec: Rectangle, col1: Color, col2: Color, col3: Color, col4: Color) void;
pub extern fn DrawRectangleLines(posX: c_int, posY: c_int, width: c_int, height: c_int, color: Color) void;
pub extern fn DrawRectangleLinesEx(rec: Rectangle, lineThick: c_int, color: Color) void;
pub extern fn DrawRectangleRounded(rec: Rectangle, roundness: f32, segments: c_int, color: Color) void;
pub extern fn DrawRectangleRoundedLines(rec: Rectangle, roundness: f32, segments: c_int, lineThick: c_int, color: Color) void;
pub extern fn DrawTriangle(v1: Vector2, v2: Vector2, v3: Vector2, color: Color) void;
pub extern fn DrawTriangleLines(v1: Vector2, v2: Vector2, v3: Vector2, color: Color) void;
pub extern fn DrawTriangleFan(points: [*c]Vector2, numPoints: c_int, color: Color) void;
pub extern fn DrawPoly(center: Vector2, sides: c_int, radius: f32, rotation: f32, color: Color) void;
pub extern fn SetShapesTexture(texture: Texture2D, source: Rectangle) void;
// pub extern fn CheckCollisionRecs(rec1: Rectangle, rec2: Rectangle) bool;

pub extern fn CheckCollisionCircles(center1: Vector2, radius1: f32, center2: Vector2, radius2: f32) bool;
pub extern fn CheckCollisionCircleRec(center: Vector2, radius: f32, rec: Rectangle) bool;
pub extern fn GetCollisionRec(rec1: Rectangle, rec2: Rectangle) Rectangle;
pub extern fn CheckCollisionPointRec(point: Vector2, rec: Rectangle) bool;
pub extern fn CheckCollisionPointCircle(point: Vector2, center: Vector2, radius: f32) bool;
pub extern fn CheckCollisionPointTriangle(point: Vector2, p1: Vector2, p2: Vector2, p3: Vector2) bool;
pub extern fn LoadImage(fileName: [*c]const u8) Image;
pub extern fn LoadImageEx(pixels: [*c]Color, width: c_int, height: c_int) Image;
pub extern fn LoadImagePro(data: ?*c_void, width: c_int, height: c_int, format: c_int) Image;
pub extern fn LoadImageRaw(fileName: [*c]const u8, width: c_int, height: c_int, format: c_int, headerSize: c_int) Image;
pub extern fn ExportImage(image: Image, fileName: [*c]const u8) void;
pub extern fn ExportImageAsCode(image: Image, fileName: [*c]const u8) void;
pub extern fn LoadTexture(fileName: [*c]const u8) Texture2D;
pub extern fn LoadTextureFromImage(image: Image) Texture2D;
pub extern fn LoadTextureCubemap(image: Image, layoutType: c_int) TextureCubemap;
pub extern fn LoadRenderTexture(width: c_int, height: c_int) RenderTexture2D;
pub extern fn UnloadImage(image: Image) void;
pub extern fn UnloadTexture(texture: Texture2D) void;
pub extern fn UnloadRenderTexture(target: RenderTexture2D) void;
pub extern fn GetImageData(image: Image) [*c]Color;
pub extern fn GetImageDataNormalized(image: Image) [*c]Vector4;
pub extern fn GetPixelDataSize(width: c_int, height: c_int, format: c_int) c_int;
pub extern fn GetTextureData(texture: Texture2D) Image;
pub extern fn GetScreenData() Image;
pub extern fn UpdateTexture(texture: Texture2D, pixels: ?*const c_void) void;
pub extern fn ImageCopy(image: Image) Image;
pub extern fn ImageToPOT(image: [*c]Image, fillColor: Color) void;
pub extern fn ImageFormat(image: [*c]Image, newFormat: c_int) void;
pub extern fn ImageAlphaMask(image: [*c]Image, alphaMask: Image) void;
pub extern fn ImageAlphaClear(image: [*c]Image, color: Color, threshold: f32) void;
pub extern fn ImageAlphaCrop(image: [*c]Image, threshold: f32) void;
pub extern fn ImageAlphaPremultiply(image: [*c]Image) void;
pub extern fn ImageCrop(image: [*c]Image, crop: Rectangle) void;
pub extern fn ImageResize(image: [*c]Image, newWidth: c_int, newHeight: c_int) void;
pub extern fn ImageResizeNN(image: [*c]Image, newWidth: c_int, newHeight: c_int) void;
pub extern fn ImageResizeCanvas(image: [*c]Image, newWidth: c_int, newHeight: c_int, offsetX: c_int, offsetY: c_int, color: Color) void;
pub extern fn ImageMipmaps(image: [*c]Image) void;
pub extern fn ImageDither(image: [*c]Image, rBpp: c_int, gBpp: c_int, bBpp: c_int, aBpp: c_int) void;
pub extern fn ImageExtractPalette(image: Image, maxPaletteSize: c_int, extractCount: [*c]c_int) [*c]Color;
pub extern fn ImageText(text: [*c]const u8, fontSize: c_int, color: Color) Image;
pub extern fn ImageTextEx(font: Font, text: [*c]const u8, fontSize: f32, spacing: f32, tint: Color) Image;
pub extern fn ImageDraw(dst: [*c]Image, src: Image, srcRec: Rectangle, dstRec: Rectangle) void;
pub extern fn ImageDrawRectangle(dst: [*c]Image, rec: Rectangle, color: Color) void;
pub extern fn ImageDrawRectangleLines(dst: [*c]Image, rec: Rectangle, thick: c_int, color: Color) void;
pub extern fn ImageDrawText(dst: [*c]Image, position: Vector2, text: [*c]const u8, fontSize: c_int, color: Color) void;
pub extern fn ImageDrawTextEx(dst: [*c]Image, position: Vector2, font: Font, text: [*c]const u8, fontSize: f32, spacing: f32, color: Color) void;
pub extern fn ImageFlipVertical(image: [*c]Image) void;
pub extern fn ImageFlipHorizontal(image: [*c]Image) void;
pub extern fn ImageRotateCW(image: [*c]Image) void;
pub extern fn ImageRotateCCW(image: [*c]Image) void;
pub extern fn ImageColorTint(image: [*c]Image, color: Color) void;
pub extern fn ImageColorInvert(image: [*c]Image) void;
pub extern fn ImageColorGrayscale(image: [*c]Image) void;
pub extern fn ImageColorContrast(image: [*c]Image, contrast: f32) void;
pub extern fn ImageColorBrightness(image: [*c]Image, brightness: c_int) void;
pub extern fn ImageColorReplace(image: [*c]Image, color: Color, replace: Color) void;
pub extern fn GenImageColor(width: c_int, height: c_int, color: Color) Image;
pub extern fn GenImageGradientV(width: c_int, height: c_int, top: Color, bottom: Color) Image;
pub extern fn GenImageGradientH(width: c_int, height: c_int, left: Color, right: Color) Image;
pub extern fn GenImageGradientRadial(width: c_int, height: c_int, density: f32, inner: Color, outer: Color) Image;
pub extern fn GenImageChecked(width: c_int, height: c_int, checksX: c_int, checksY: c_int, col1: Color, col2: Color) Image;
pub extern fn GenImageWhiteNoise(width: c_int, height: c_int, factor: f32) Image;
pub extern fn GenImagePerlinNoise(width: c_int, height: c_int, offsetX: c_int, offsetY: c_int, scale: f32) Image;
pub extern fn GenImageCellular(width: c_int, height: c_int, tileSize: c_int) Image;
pub extern fn GenTextureMipmaps(texture: [*c]Texture2D) void;
pub extern fn SetTextureFilter(texture: Texture2D, filterMode: c_int) void;
pub extern fn SetTextureWrap(texture: Texture2D, wrapMode: c_int) void;
pub extern fn DrawTexture(texture: Texture2D, posX: c_int, posY: c_int, tint: Color) void;
pub extern fn DrawTextureV(texture: Texture2D, position: Vector2, tint: Color) void;
pub extern fn DrawTextureEx(texture: Texture2D, position: Vector2, rotation: f32, scale: f32, tint: Color) void;
pub extern fn DrawTextureRec(texture: Texture2D, sourceRec: Rectangle, position: Vector2, tint: Color) void;
pub extern fn DrawTextureQuad(texture: Texture2D, tiling: Vector2, offset: Vector2, quad: Rectangle, tint: Color) void;
pub extern fn DrawTexturePro(texture: Texture2D, sourceRec: Rectangle, destRec: Rectangle, origin: Vector2, rotation: f32, tint: Color) void;
pub extern fn DrawTextureNPatch(texture: Texture2D, nPatchInfo: NPatchInfo, destRec: Rectangle, origin: Vector2, rotation: f32, tint: Color) void;
pub extern fn GetFontDefault() Font;
pub extern fn LoadFont(fileName: [*c]const u8) Font;
pub extern fn LoadFontEx(fileName: [*c]const u8, fontSize: c_int, fontChars: [*c]c_int, charsCount: c_int) Font;
pub extern fn LoadFontFromImage(image: Image, key: Color, firstChar: c_int) Font;
pub extern fn LoadFontData(fileName: [*c]const u8, fontSize: c_int, fontChars: [*c]c_int, charsCount: c_int, type_0: c_int) [*c]CharInfo;
pub extern fn GenImageFontAtlas(chars: [*c]CharInfo, charsCount: c_int, fontSize: c_int, padding: c_int, packMethod: c_int) Image;
pub extern fn UnloadFont(font: Font) void;
pub extern fn DrawFPS(posX: c_int, posY: c_int) void;
pub extern fn DrawText(text: [*c]const u8, posX: c_int, posY: c_int, fontSize: c_int, color: Color) void;
pub extern fn DrawTextEx(font: Font, text: [*c]const u8, position: Vector2, fontSize: f32, spacing: f32, tint: Color) void;
pub extern fn DrawTextRec(font: Font, text: [*c]const u8, rec: Rectangle, fontSize: f32, spacing: f32, wordWrap: bool, tint: Color) void;
pub extern fn DrawTextRecEx(font: Font, text: [*c]const u8, rec: Rectangle, fontSize: f32, spacing: f32, wordWrap: bool, tint: Color, selectStart: c_int, selectLength: c_int, selectText: Color, selectBack: Color) void;
pub extern fn MeasureText(text: [*c]const u8, fontSize: c_int) c_int;
pub extern fn MeasureTextEx(font: Font, text: [*c]const u8, fontSize: f32, spacing: f32) Vector2;
pub extern fn GetGlyphIndex(font: Font, character: c_int) c_int;
pub extern fn GetNextCodepoint(text: [*c]const u8, count: [*c]c_int) c_int;
pub extern fn TextIsEqual(text1: [*c]const u8, text2: [*c]const u8) bool;
pub extern fn TextLength(text: [*c]const u8) c_uint;
pub extern fn TextCountCodepoints(text: [*c]const u8) c_uint;
pub extern fn TextFormat(text: [*c]const u8, ...) [*c]const u8;
pub extern fn TextSubtext(text: [*c]const u8, position: c_int, length: c_int) [*c]const u8;
pub extern fn TextReplace(text: [*c]u8, replace: [*c]const u8, by: [*c]const u8) [*c]const u8;
pub extern fn TextInsert(text: [*c]const u8, insert: [*c]const u8, position: c_int) [*c]const u8;
pub extern fn TextJoin(textList: [*c]([*c]const u8), count: c_int, delimiter: [*c]const u8) [*c]const u8;
pub extern fn TextSplit(text: [*c]const u8, delimiter: u8, count: [*c]c_int) [*c]([*c]const u8);
pub extern fn TextAppend(text: [*c]u8, append: [*c]const u8, position: [*c]c_int) void;
pub extern fn TextFindIndex(text: [*c]const u8, find: [*c]const u8) c_int;
pub extern fn TextToUpper(text: [*c]const u8) [*c]const u8;
pub extern fn TextToLower(text: [*c]const u8) [*c]const u8;
pub extern fn TextToPascal(text: [*c]const u8) [*c]const u8;
pub extern fn TextToInteger(text: [*c]const u8) c_int;
pub extern fn DrawLine3D(startPos: Vector3, endPos: Vector3, color: Color) void;
pub extern fn DrawCircle3D(center: Vector3, radius: f32, rotationAxis: Vector3, rotationAngle: f32, color: Color) void;
pub extern fn DrawCube(position: Vector3, width: f32, height: f32, length: f32, color: Color) void;
pub extern fn DrawCubeV(position: Vector3, size: Vector3, color: Color) void;
pub extern fn DrawCubeWires(position: Vector3, width: f32, height: f32, length: f32, color: Color) void;
pub extern fn DrawCubeWiresV(position: Vector3, size: Vector3, color: Color) void;
pub extern fn DrawCubeTexture(texture: Texture2D, position: Vector3, width: f32, height: f32, length: f32, color: Color) void;
pub extern fn DrawSphere(centerPos: Vector3, radius: f32, color: Color) void;
pub extern fn DrawSphereEx(centerPos: Vector3, radius: f32, rings: c_int, slices: c_int, color: Color) void;
pub extern fn DrawSphereWires(centerPos: Vector3, radius: f32, rings: c_int, slices: c_int, color: Color) void;
pub extern fn DrawCylinder(position: Vector3, radiusTop: f32, radiusBottom: f32, height: f32, slices: c_int, color: Color) void;
pub extern fn DrawCylinderWires(position: Vector3, radiusTop: f32, radiusBottom: f32, height: f32, slices: c_int, color: Color) void;
pub extern fn DrawPlane(centerPos: Vector3, size: Vector2, color: Color) void;
pub extern fn DrawRay(ray: Ray, color: Color) void;
pub extern fn DrawGrid(slices: c_int, spacing: f32) void;
pub extern fn DrawGizmo(position: Vector3) void;
pub extern fn LoadModel(fileName: [*c]const u8) Model;
pub extern fn LoadModelFromMesh(mesh: Mesh) Model;
pub extern fn UnloadModel(model: Model) void;
pub extern fn LoadMeshes(fileName: [*c]const u8, meshCount: [*c]c_int) [*c]Mesh;
pub extern fn ExportMesh(mesh: Mesh, fileName: [*c]const u8) void;
pub extern fn UnloadMesh(mesh: [*c]Mesh) void;
pub extern fn LoadMaterials(fileName: [*c]const u8, materialCount: [*c]c_int) [*c]Material;
pub extern fn LoadMaterialDefault() Material;
pub extern fn UnloadMaterial(material: Material) void;
pub extern fn SetMaterialTexture(material: [*c]Material, mapType: c_int, texture: Texture2D) void;
pub extern fn SetModelMeshMaterial(model: [*c]Model, meshId: c_int, materialId: c_int) void;
pub extern fn LoadModelAnimations(fileName: [*c]const u8, animsCount: [*c]c_int) [*c]ModelAnimation;
pub extern fn UpdateModelAnimation(model: Model, anim: ModelAnimation, frame: c_int) void;
pub extern fn UnloadModelAnimation(anim: ModelAnimation) void;
pub extern fn IsModelAnimationValid(model: Model, anim: ModelAnimation) bool;
pub extern fn GenMeshPoly(sides: c_int, radius: f32) Mesh;
pub extern fn GenMeshPlane(width: f32, length: f32, resX: c_int, resZ: c_int) Mesh;
pub extern fn GenMeshCube(width: f32, height: f32, length: f32) Mesh;
pub extern fn GenMeshSphere(radius: f32, rings: c_int, slices: c_int) Mesh;
pub extern fn GenMeshHemiSphere(radius: f32, rings: c_int, slices: c_int) Mesh;
pub extern fn GenMeshCylinder(radius: f32, height: f32, slices: c_int) Mesh;
pub extern fn GenMeshTorus(radius: f32, size: f32, radSeg: c_int, sides: c_int) Mesh;
pub extern fn GenMeshKnot(radius: f32, size: f32, radSeg: c_int, sides: c_int) Mesh;
pub extern fn GenMeshHeightmap(heightmap: Image, size: Vector3) Mesh;
pub extern fn GenMeshCubicmap(cubicmap: Image, cubeSize: Vector3) Mesh;
pub extern fn MeshBoundingBox(mesh: Mesh) BoundingBox;
pub extern fn MeshTangents(mesh: [*c]Mesh) void;
pub extern fn MeshBinormals(mesh: [*c]Mesh) void;
pub extern fn DrawModel(model: Model, position: Vector3, scale: f32, tint: Color) void;
pub extern fn DrawModelEx(model: Model, position: Vector3, rotationAxis: Vector3, rotationAngle: f32, scale: Vector3, tint: Color) void;
pub extern fn DrawModelWires(model: Model, position: Vector3, scale: f32, tint: Color) void;
pub extern fn DrawModelWiresEx(model: Model, position: Vector3, rotationAxis: Vector3, rotationAngle: f32, scale: Vector3, tint: Color) void;
pub extern fn DrawBoundingBox(box: BoundingBox, color: Color) void;
pub extern fn DrawBillboard(camera: Camera, texture: Texture2D, center: Vector3, size: f32, tint: Color) void;
pub extern fn DrawBillboardRec(camera: Camera, texture: Texture2D, sourceRec: Rectangle, center: Vector3, size: f32, tint: Color) void;
pub extern fn CheckCollisionSpheres(centerA: Vector3, radiusA: f32, centerB: Vector3, radiusB: f32) bool;
pub extern fn CheckCollisionBoxes(box1: BoundingBox, box2: BoundingBox) bool;
pub extern fn CheckCollisionBoxSphere(box: BoundingBox, centerSphere: Vector3, radiusSphere: f32) bool;
pub extern fn CheckCollisionRaySphere(ray: Ray, spherePosition: Vector3, sphereRadius: f32) bool;
pub extern fn CheckCollisionRaySphereEx(ray: Ray, spherePosition: Vector3, sphereRadius: f32, collisionPoint: [*c]Vector3) bool;
pub extern fn CheckCollisionRayBox(ray: Ray, box: BoundingBox) bool;
pub extern fn GetCollisionRayModel(ray: Ray, model: [*c]Model) RayHitInfo;
pub extern fn GetCollisionRayTriangle(ray: Ray, p1: Vector3, p2: Vector3, p3: Vector3) RayHitInfo;
pub extern fn GetCollisionRayGround(ray: Ray, groundHeight: f32) RayHitInfo;
pub extern fn LoadText(fileName: [*c]const u8) [*c]u8;
pub extern fn LoadShader(vsFileName: [*c]const u8, fsFileName: [*c]const u8) Shader;
pub extern fn LoadShaderCode(vsCode: [*c]u8, fsCode: [*c]u8) Shader;
pub extern fn UnloadShader(shader: Shader) void;
pub extern fn GetShaderDefault() Shader;
pub extern fn GetTextureDefault() Texture2D;
pub extern fn GetShaderLocation(shader: Shader, uniformName: [*c]const u8) c_int;
pub extern fn SetShaderValue(shader: Shader, uniformLoc: c_int, value: ?*const c_void, uniformType: c_int) void;
pub extern fn SetShaderValueV(shader: Shader, uniformLoc: c_int, value: ?*const c_void, uniformType: c_int, count: c_int) void;
pub extern fn SetShaderValueMatrix(shader: Shader, uniformLoc: c_int, mat: Matrix) void;
pub extern fn SetShaderValueTexture(shader: Shader, uniformLoc: c_int, texture: Texture2D) void;
pub extern fn SetMatrixProjection(proj: Matrix) void;
pub extern fn SetMatrixModelview(view: Matrix) void;
pub extern fn GetMatrixModelview() Matrix;
pub extern fn GenTextureCubemap(shader: Shader, skyHDR: Texture2D, size: c_int) Texture2D;
pub extern fn GenTextureIrradiance(shader: Shader, cubemap: Texture2D, size: c_int) Texture2D;
pub extern fn GenTexturePrefilter(shader: Shader, cubemap: Texture2D, size: c_int) Texture2D;
pub extern fn GenTextureBRDF(shader: Shader, size: c_int) Texture2D;
pub extern fn BeginShaderMode(shader: Shader) void;
pub extern fn EndShaderMode() void;
pub extern fn BeginBlendMode(mode: c_int) void;
pub extern fn EndBlendMode() void;
pub extern fn BeginScissorMode(x: c_int, y: c_int, width: c_int, height: c_int) void;
pub extern fn EndScissorMode() void;
pub extern fn InitVrSimulator() void;
pub extern fn CloseVrSimulator() void;
pub extern fn UpdateVrTracking(camera: [*c]Camera) void;
pub extern fn SetVrConfiguration(info: VrDeviceInfo, distortion: Shader) void;
pub extern fn IsVrSimulatorReady() bool;
pub extern fn ToggleVrMode() void;
pub extern fn BeginVrDrawing() void;
pub extern fn EndVrDrawing() void;
pub extern fn InitAudioDevice() void;
pub extern fn CloseAudioDevice() void;
pub extern fn IsAudioDeviceReady() bool;
pub extern fn SetMasterVolume(volume: f32) void;
pub extern fn LoadWave(fileName: [*c]const u8) Wave;
pub extern fn LoadWaveEx(data: ?*c_void, sampleCount: c_int, sampleRate: c_int, sampleSize: c_int, channels: c_int) Wave;
pub extern fn LoadSound(fileName: [*c]const u8) Sound;
pub extern fn LoadSoundFromWave(wave: Wave) Sound;
pub extern fn UpdateSound(sound: Sound, data: ?*const c_void, samplesCount: c_int) void;
pub extern fn UnloadWave(wave: Wave) void;
pub extern fn UnloadSound(sound: Sound) void;
pub extern fn ExportWave(wave: Wave, fileName: [*c]const u8) void;
pub extern fn ExportWaveAsCode(wave: Wave, fileName: [*c]const u8) void;
pub extern fn PlaySound(sound: Sound) void;
pub extern fn PauseSound(sound: Sound) void;
pub extern fn ResumeSound(sound: Sound) void;
pub extern fn StopSound(sound: Sound) void;
pub extern fn IsSoundPlaying(sound: Sound) bool;
pub extern fn SetSoundVolume(sound: Sound, volume: f32) void;
pub extern fn SetSoundPitch(sound: Sound, pitch: f32) void;
pub extern fn WaveFormat(wave: [*c]Wave, sampleRate: c_int, sampleSize: c_int, channels: c_int) void;
pub extern fn WaveCopy(wave: Wave) Wave;
pub extern fn WaveCrop(wave: [*c]Wave, initSample: c_int, finalSample: c_int) void;
pub extern fn GetWaveData(wave: Wave) [*c]f32;
pub extern fn LoadMusicStream(fileName: [*c]const u8) Music;
pub extern fn UnloadMusicStream(music: Music) void;
pub extern fn PlayMusicStream(music: Music) void;
pub extern fn UpdateMusicStream(music: Music) void;
pub extern fn StopMusicStream(music: Music) void;
pub extern fn PauseMusicStream(music: Music) void;
pub extern fn ResumeMusicStream(music: Music) void;
pub extern fn IsMusicPlaying(music: Music) bool;
pub extern fn SetMusicVolume(music: Music, volume: f32) void;
pub extern fn SetMusicPitch(music: Music, pitch: f32) void;
pub extern fn SetMusicLoopCount(music: Music, count: c_int) void;
pub extern fn GetMusicTimeLength(music: Music) f32;
pub extern fn GetMusicTimePlayed(music: Music) f32;
pub extern fn InitAudioStream(sampleRate: c_uint, sampleSize: c_uint, channels: c_uint) AudioStream;
pub extern fn UpdateAudioStream(stream: AudioStream, data: ?*const c_void, samplesCount: c_int) void;
pub extern fn CloseAudioStream(stream: AudioStream) void;
pub extern fn IsAudioBufferProcessed(stream: AudioStream) bool;
pub extern fn PlayAudioStream(stream: AudioStream) void;
pub extern fn PauseAudioStream(stream: AudioStream) void;
pub extern fn ResumeAudioStream(stream: AudioStream) void;
pub extern fn IsAudioStreamPlaying(stream: AudioStream) bool;
pub extern fn StopAudioStream(stream: AudioStream) void;
pub extern fn SetAudioStreamVolume(stream: AudioStream, volume: f32) void;
pub extern fn SetAudioStreamPitch(stream: AudioStream, pitch: f32) void;
pub const __GCC_ATOMIC_TEST_AND_SET_TRUEVAL = 1;
pub const __FLT16_MAX_EXP__ = 15;
pub const __GNUC_VA_LIST = 1;
pub const __BIGGEST_ALIGNMENT__ = 16;
pub const __SIZEOF_FLOAT__ = 4;
pub const __INT64_FMTd__ = c"ld";
pub const __STDC_VERSION__ = c_long(201112);
pub const __INT_LEAST32_FMTi__ = c"i";
pub const __INT_LEAST8_FMTi__ = c"hhi";
pub const __LDBL_EPSILON__ = -nan;
pub const __LZCNT__ = 1;
pub const __INT_LEAST32_FMTd__ = c"d";
pub const __STDC_UTF_32__ = 1;
pub const __INVPCID__ = 1;
pub const LOC_MAP_SPECULAR = LOC_MAP_METALNESS;
pub const __SIG_ATOMIC_WIDTH__ = 32;
pub const __UINT_FAST64_FMTX__ = c"lX";
pub const __GCC_ATOMIC_LLONG_LOCK_FREE = 2;
pub const __clang_version__ = c"8.0.0 (tags/RELEASE_800/rc5)";
pub const __UINT_LEAST8_FMTo__ = c"hho";
pub const __SIZEOF_DOUBLE__ = 8;
pub const __INTMAX_FMTd__ = c"ld";
pub const __CLANG_ATOMIC_CHAR_LOCK_FREE = 2;
pub const __INT_LEAST16_FMTi__ = c"hi";
pub const __GCC_ATOMIC_SHORT_LOCK_FREE = 2;
pub const __FMA__ = 1;
pub const __MMX__ = 1;
pub const __GCC_HAVE_SYNC_COMPARE_AND_SWAP_16 = 1;
pub const __SIZE_FMTX__ = c"lX";
pub const __RDSEED__ = 1;
pub const __WCHAR_WIDTH__ = 32;
pub const __FSGSBASE__ = 1;
pub const __PTRDIFF_FMTd__ = c"ld";
pub const __DBL_MIN_EXP__ = -1021;
pub const __FLT_EVAL_METHOD__ = 0;
pub const __SSE_MATH__ = 1;
pub const __UINT_FAST8_FMTo__ = c"hho";
pub const __UINT_LEAST64_MAX__ = c_ulong(18446744073709551615);
pub const __UINT_LEAST64_FMTx__ = c"lx";
pub const __INT8_MAX__ = 127;
pub const __DBL_HAS_DENORM__ = 1;
pub const __FLOAT128__ = 1;
pub const __FLT16_HAS_QUIET_NAN__ = 1;
pub const __ATOMIC_RELAXED = 0;
pub const __DBL_DECIMAL_DIG__ = 17;
pub const __XSAVEC__ = 1;
pub const __SIZEOF_SHORT__ = 2;
pub const __UINT_FAST16_MAX__ = 65535;
pub const __UINT16_FMTX__ = c"hX";
pub const MAP_DIFFUSE = MAP_ALBEDO;
pub const __CLANG_ATOMIC_SHORT_LOCK_FREE = 2;
pub const __SSSE3__ = 1;
pub const __CONSTANT_CFSTRINGS__ = 1;
pub const __AVX2__ = 1;
pub const __WINT_MAX__ = c_uint(4294967295);
pub const __LDBL_MAX_EXP__ = 16384;
pub const __NO_MATH_INLINES = 1;
pub const __WCHAR_TYPE__ = int;
pub const __LONG_MAX__ = c_long(9223372036854775807);
pub const __STDC_HOSTED__ = 1;
pub const __pic__ = 2;
pub const __PTRDIFF_WIDTH__ = 64;
pub const __INT_FAST16_FMTi__ = c"hi";
pub const __INT_LEAST32_TYPE__ = int;
pub const __SCHAR_MAX__ = 127;
pub const __LDBL_DENORM_MIN__ = -nan;
pub const __FLT16_MIN_EXP__ = -14;
pub const LOC_MAP_DIFFUSE = LOC_MAP_ALBEDO;
pub const __PRFCHW__ = 1;
pub const __INT64_C_SUFFIX__ = L;
pub const __ELF__ = 1;
pub const __LDBL_MANT_DIG__ = 64;
pub const __CLANG_ATOMIC_INT_LOCK_FREE = 2;
pub const __SIZEOF_PTRDIFF_T__ = 8;
pub const __SIG_ATOMIC_MAX__ = 2147483647;
pub const __UINT64_FMTX__ = c"lX";
pub const __UINT64_MAX__ = c_ulong(18446744073709551615);
pub const __DBL_MANT_DIG__ = 53;
pub const __FLT_DECIMAL_DIG__ = 9;
pub const __INT_LEAST32_MAX__ = 2147483647;
pub const __DBL_DIG__ = 15;
pub const __ATOMIC_ACQUIRE = 2;
pub const __OPENCL_MEMORY_SCOPE_WORK_GROUP = 1;
pub const __FLT16_HAS_DENORM__ = 1;
pub const __UINT_FAST16_FMTu__ = c"hu";
pub const __INTPTR_FMTi__ = c"li";
pub const __UINT_FAST8_FMTX__ = c"hhX";
pub const __LITTLE_ENDIAN__ = 1;
pub const __SSE__ = 1;
pub const __FLT_HAS_QUIET_NAN__ = 1;
pub const __SIZEOF_SIZE_T__ = 8;
pub const __UINT_LEAST16_FMTo__ = c"ho";
pub const __UINT8_FMTo__ = c"hho";
pub const __UINT_LEAST16_FMTx__ = c"hx";
pub const __CLANG_ATOMIC_WCHAR_T_LOCK_FREE = 2;
pub const __UINT_FAST16_FMTX__ = c"hX";
pub const __VERSION__ = c"4.2.1 Compatible Clang 8.0.0 (tags/RELEASE_800/rc5)";
pub const __UINT_FAST32_FMTx__ = c"x";
pub const __UINTPTR_MAX__ = c_ulong(18446744073709551615);
pub const __UINT_FAST8_FMTu__ = c"hhu";
pub const __UINT_LEAST8_FMTu__ = c"hhu";
pub const __UINT_LEAST64_FMTo__ = c"lo";
pub const __UINT_LEAST8_MAX__ = 255;
pub const __RDRND__ = 1;
pub const __bool_true_false_are_defined = 1;
pub const __SIZEOF_WCHAR_T__ = 4;
pub const __MOVBE__ = 1;
pub const __LDBL_MAX__ = -nan;
pub const __UINT16_MAX__ = 65535;
pub const _LP64 = 1;
pub const __x86_64 = 1;
pub const __code_model_small_ = 1;
pub const linux = 1;
pub const __SIZEOF_WINT_T__ = 4;
pub const __UINTMAX_FMTo__ = c"lo";
pub const __FLT_DIG__ = 6;
pub const __UINT_LEAST8_FMTX__ = c"hhX";
pub const __INT16_MAX__ = 32767;
pub const __WINT_UNSIGNED__ = 1;
pub const __FLT_MAX_10_EXP__ = 38;
pub const __UINTPTR_FMTX__ = c"lX";
pub const __UINT_LEAST16_FMTu__ = c"hu";
pub const __CLANG_ATOMIC_POINTER_LOCK_FREE = 2;
pub const __WINT_WIDTH__ = 32;
pub const __F16C__ = 1;
pub const __SHRT_MAX__ = 32767;
pub const __GCC_ATOMIC_BOOL_LOCK_FREE = 2;
pub const __POINTER_WIDTH__ = 64;
pub const __PTRDIFF_MAX__ = c_long(9223372036854775807);
pub const __tune_corei7__ = 1;
pub const __FLT16_DIG__ = 3;
pub const __INT32_FMTd__ = c"d";
pub const __DBL_MIN__ = -nan;
pub const __SIZEOF_LONG__ = 8;
pub const __INTPTR_WIDTH__ = 64;
pub const __FLT16_MAX_10_EXP__ = 4;
pub const __INT_FAST32_TYPE__ = int;
pub const @"false" = 0;
pub const __NO_INLINE__ = 1;
pub const __UINT_FAST32_FMTX__ = c"X";
pub const __gnu_linux__ = 1;
pub const __INT_FAST32_MAX__ = 2147483647;
pub const __corei7__ = 1;
pub const __UINTMAX_FMTu__ = c"lu";
pub const __BMI__ = 1;
pub const __FLT_RADIX__ = 2;
pub const __FLT16_HAS_INFINITY__ = 1;
pub const __GCC_HAVE_SYNC_COMPARE_AND_SWAP_1 = 1;
pub const __GCC_ATOMIC_INT_LOCK_FREE = 2;
pub const __SGX__ = 1;
pub const __OPENCL_MEMORY_SCOPE_ALL_SVM_DEVICES = 3;
pub const __FLT16_DECIMAL_DIG__ = 5;
pub const __PRAGMA_REDEFINE_EXTNAME = 1;
pub const __INT_FAST8_FMTd__ = c"hhd";
pub const MAX_TOUCH_POINTS = 10;
pub const __INT32_TYPE__ = int;
pub const __UINTMAX_WIDTH__ = 64;
pub const __FLT_MIN__ = -nan;
pub const __INT64_FMTi__ = c"li";
pub const __UINT_FAST64_FMTu__ = c"lu";
pub const __INT8_FMTd__ = c"hhd";
pub const __INT_FAST16_TYPE__ = short;
pub const __FLT_MAX_EXP__ = 128;
pub const __XSAVE__ = 1;
pub const __DBL_MAX_10_EXP__ = 308;
pub const __LDBL_MIN__ = -nan;
pub const __INT_FAST64_FMTi__ = c"li";
pub const __INT_LEAST8_FMTd__ = c"hhd";
pub const __CLANG_ATOMIC_LLONG_LOCK_FREE = 2;
pub const __UINT_LEAST32_FMTX__ = c"X";
pub const __PIC__ = 2;
pub const __UINTMAX_MAX__ = c_ulong(18446744073709551615);
pub const __UINT_FAST16_FMTo__ = c"ho";
pub const __LDBL_DECIMAL_DIG__ = 21;
pub const __UINT_LEAST64_FMTX__ = c"lX";
pub const __clang_minor__ = 0;
pub const __SIZEOF_FLOAT128__ = 16;
pub const __UINT_FAST64_FMTo__ = c"lo";
pub const __SIZE_FMTx__ = c"lx";
pub const __DBL_MAX__ = -nan;
pub const __DBL_EPSILON__ = -nan;
pub const __UINT64_FMTx__ = c"lx";
pub const @"true" = 1;
pub const __CHAR_BIT__ = 8;
pub const __INT16_FMTi__ = c"hi";
pub const _DEBUG = 1;
pub const __GNUC_MINOR__ = 2;
pub const __UINT_FAST32_MAX__ = c_uint(4294967295);
pub const ShowWindow = UnhideWindow;
pub const __UINT8_FMTX__ = c"hhX";
pub const __FLT_EPSILON__ = -nan;
pub const __UINTPTR_WIDTH__ = 64;
pub const __llvm__ = 1;
pub const __UINT_FAST64_MAX__ = c_ulong(18446744073709551615);
pub const __INT_FAST32_FMTi__ = c"i";
pub const __FLT_HAS_INFINITY__ = 1;
pub const __AES__ = 1;
pub const __UINT8_FMTx__ = c"hhx";
pub const __INTMAX_C_SUFFIX__ = L;
pub const __ORDER_LITTLE_ENDIAN__ = 1234;
pub const __GCC_ATOMIC_CHAR16_T_LOCK_FREE = 2;
pub const __INT16_FMTd__ = c"hd";
pub const __UINT32_FMTX__ = c"X";
pub const __GCC_HAVE_SYNC_COMPARE_AND_SWAP_4 = 1;
pub const __UINT32_C_SUFFIX__ = U;
pub const __INT32_MAX__ = 2147483647;
pub const __GCC_ATOMIC_CHAR_LOCK_FREE = 2;
pub const __INTMAX_WIDTH__ = 64;
pub const __CLANG_ATOMIC_BOOL_LOCK_FREE = 2;
pub const __SIZE_FMTo__ = c"lo";
pub const __DBL_HAS_QUIET_NAN__ = 1;
pub const __INT_FAST8_FMTi__ = c"hhi";
pub const __UINT_LEAST32_FMTo__ = c"o";
pub const __STDC_UTF_16__ = 1;
pub const __UINT_LEAST32_MAX__ = c_uint(4294967295);
pub const __ATOMIC_RELEASE = 3;
pub const __UINT_FAST16_FMTx__ = c"hx";
pub const __UINTMAX_C_SUFFIX__ = UL;
pub const FormatText = TextFormat;
pub const __FLT_MIN_EXP__ = -125;
pub const __SIZEOF_LONG_DOUBLE__ = 16;
pub const __UINT_LEAST64_FMTu__ = c"lu";
pub const __GCC_ATOMIC_LONG_LOCK_FREE = 2;
pub const __ORDER_PDP_ENDIAN__ = 3412;
pub const __INT_FAST64_FMTd__ = c"ld";
pub const __CLANG_ATOMIC_LONG_LOCK_FREE = 2;
pub const __GXX_ABI_VERSION = 1002;
pub const __INT16_TYPE__ = short;
pub const __SSE2_MATH__ = 1;
pub const __FLT_MANT_DIG__ = 24;
pub const __UINT_FAST64_FMTx__ = c"lx";
pub const __STDC__ = 1;
pub const __INT_FAST8_MAX__ = 127;
pub const __INTPTR_FMTd__ = c"ld";
pub const __GNUC_PATCHLEVEL__ = 1;
pub const __SIZE_WIDTH__ = 64;
pub const __UINT_LEAST8_FMTx__ = c"hhx";
pub const __MPX__ = 1;
pub const __INT_LEAST64_FMTi__ = c"li";
pub const __SSE4_2__ = 1;
pub const __AVX__ = 1;
pub const __INT_FAST16_MAX__ = 32767;
pub const __INTPTR_MAX__ = c_long(9223372036854775807);
pub const __CLANG_ATOMIC_CHAR16_T_LOCK_FREE = 2;
pub const __UINT64_FMTu__ = c"lu";
pub const __BYTE_ORDER__ = __ORDER_LITTLE_ENDIAN__;
pub const __SSE2__ = 1;
pub const __INT_MAX__ = 2147483647;
pub const __INTMAX_FMTi__ = c"li";
pub const MAP_SPECULAR = MAP_METALNESS;
pub const __DBL_DENORM_MIN__ = -nan;
pub const __clang_major__ = 8;
pub const __FLT16_MANT_DIG__ = 11;
pub const __GNUC__ = 4;
pub const __UINT32_MAX__ = c_uint(4294967295);
pub const PI = -nan;
pub const __FLT_DENORM_MIN__ = -nan;
pub const __DBL_MAX_EXP__ = 1024;
pub const __INT8_FMTi__ = c"hhi";
pub const __UINT_LEAST16_MAX__ = 65535;
pub const __XSAVES__ = 1;
pub const __LDBL_HAS_DENORM__ = 1;
pub const __FLT16_MIN_10_EXP__ = -13;
pub const __LDBL_HAS_QUIET_NAN__ = 1;
pub const __UINT_FAST8_MAX__ = 255;
pub const __DBL_MIN_10_EXP__ = -307;
pub const __UINT8_FMTu__ = c"hhu";
pub const __INT_FAST64_MAX__ = c_long(9223372036854775807);
pub const __SSE3__ = 1;
pub const __UINT16_FMTu__ = c"hu";
pub const __ATOMIC_SEQ_CST = 5;
pub const __SIZE_FMTu__ = c"lu";
pub const __LDBL_MIN_EXP__ = -16381;
pub const __UINT_FAST32_FMTu__ = c"u";
pub const __SSP_STRONG__ = 2;
pub const __clang_patchlevel__ = 0;
pub const __SIZEOF_LONG_LONG__ = 8;
pub const __BMI2__ = 1;
pub const __GNUC_STDC_INLINE__ = 1;
pub const __PCLMUL__ = 1;
pub const __FXSR__ = 1;
pub const __UINT8_MAX__ = 255;
pub const __GCC_HAVE_SYNC_COMPARE_AND_SWAP_2 = 1;
pub const __UINT32_FMTx__ = c"x";
pub const __UINT16_FMTo__ = c"ho";
pub const __POPCNT__ = 1;
pub const __OPENCL_MEMORY_SCOPE_DEVICE = 2;
pub const __UINT32_FMTu__ = c"u";
pub const __SIZEOF_POINTER__ = 8;
pub const __SIZE_MAX__ = c_ulong(18446744073709551615);
pub const __unix = 1;
pub const __RTM__ = 1;
pub const __INT_FAST16_FMTd__ = c"hd";
pub const unix = 1;
pub const __UINT_LEAST32_FMTu__ = c"u";
pub const __FLT_MAX__ = -nan;
pub const __corei7 = 1;
pub const CLITERAL = Color;
pub const __GCC_ATOMIC_WCHAR_T_LOCK_FREE = 2;
pub const __ATOMIC_CONSUME = 1;
pub const __unix__ = 1;
pub const __x86_64__ = 1;
pub const __LDBL_HAS_INFINITY__ = 1;
pub const __UINTMAX_FMTx__ = c"lx";
pub const __UINT64_C_SUFFIX__ = UL;
pub const __INT_LEAST16_MAX__ = 32767;
pub const __FLT_MIN_10_EXP__ = -37;
pub const __UINT32_FMTo__ = c"o";
pub const __UINTPTR_FMTo__ = c"lo";
pub const __INT_LEAST16_FMTd__ = c"hd";
pub const __UINTPTR_FMTx__ = c"lx";
pub const __GCC_HAVE_SYNC_COMPARE_AND_SWAP_8 = 1;
pub const __INT_LEAST64_FMTd__ = c"ld";
pub const __INT_LEAST16_TYPE__ = short;
pub const __ORDER_BIG_ENDIAN__ = 4321;
pub const __LDBL_MIN_10_EXP__ = -4931;
pub const __INT_LEAST8_MAX__ = 127;
pub const MAX_SHADER_LOCATIONS = 32;
pub const SpriteFont = Font;
pub const __SIZEOF_INT__ = 4;
pub const SubText = TextSubtext;
pub const __GCC_ATOMIC_POINTER_LOCK_FREE = 2;
pub const __amd64 = 1;
pub const __OBJC_BOOL_IS_BOOL = 0;
pub const __ADX__ = 1;
pub const __LDBL_MAX_10_EXP__ = 4932;
pub const __SIZEOF_INT128__ = 16;
pub const __UINT_FAST8_FMTx__ = c"hhx";
pub const __linux = 1;
pub const __UINT16_FMTx__ = c"hx";
pub const __UINTPTR_FMTu__ = c"lu";
pub const __UINT_LEAST16_FMTX__ = c"hX";
pub const __CLFLUSHOPT__ = 1;
pub const __amd64__ = 1;
pub const __UINT_FAST32_FMTo__ = c"o";
pub const __linux__ = 1;
pub const __clang__ = 1;
pub const __LP64__ = 1;
pub const __PTRDIFF_FMTi__ = c"li";
pub const __SSE4_1__ = 1;
pub const __LDBL_DIG__ = 18;
pub const __GCC_ATOMIC_CHAR32_T_LOCK_FREE = 2;
pub const __XSAVEOPT__ = 1;
pub const __UINT64_FMTo__ = c"lo";
pub const __INT_FAST32_FMTd__ = c"d";
pub const __ATOMIC_ACQ_REL = 4;
pub const MAX_MATERIAL_MAPS = 12;
pub const __LONG_LONG_MAX__ = c_longlong(9223372036854775807);
pub const __OPENCL_MEMORY_SCOPE_SUB_GROUP = 4;
pub const __INTMAX_MAX__ = c_long(9223372036854775807);
pub const __UINT_LEAST32_FMTx__ = c"x";
pub const __WCHAR_MAX__ = 2147483647;
pub const __INT64_MAX__ = c_long(9223372036854775807);
pub const __CLANG_ATOMIC_CHAR32_T_LOCK_FREE = 2;
pub const __INT_LEAST64_MAX__ = c_long(9223372036854775807);
pub const __UINTMAX_FMTX__ = c"lX";
pub const __OPENCL_MEMORY_SCOPE_WORK_ITEM = 0;
pub const __FLT_HAS_DENORM__ = 1;
pub const __DECIMAL_DIG__ = __LDBL_DECIMAL_DIG__;
pub const __INT32_FMTi__ = c"i";
pub const __DBL_HAS_INFINITY__ = 1;
pub const __FINITE_MATH_ONLY__ = 0;
pub const __va_list_tag = struct___va_list_tag;
pub const MusicData = struct_MusicData;





// pub const Rectangle = struct {
//     x: f32,
//     y: f32,
//     width: f32,
//     height: f32,
// };


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
