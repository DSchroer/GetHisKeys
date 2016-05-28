//
// Simple passthrough vertex shader
//
attribute vec3 in_Position;                  // (x,y,z)
//attribute vec3 in_Normal;                  // (x,y,z)     unused in this shader.	
attribute vec4 in_Colour;                    // (r,g,b,a)
attribute vec2 in_TextureCoord;              // (u,v)

varying vec2 v_vTexcoord;
varying vec4 v_vColour;

void main()
{
    vec4 object_space_pos = vec4( in_Position.x, in_Position.y, in_Position.z, 1.0);
    gl_Position = gm_Matrices[MATRIX_WORLD_VIEW_PROJECTION] * object_space_pos;
    
    v_vColour = in_Colour;
    v_vTexcoord = in_TextureCoord;
}

//######################_==_YOYO_SHADER_MARKER_==_######################@~//
// Simple passthrough fragment shader
//
varying vec2 v_vTexcoord;
varying vec4 v_vColour;

const float image_size = 1024.0;
const float bs = 1.0;
const float bias = 0.0;

bool IsBoarder(float x, float y);

void main()
{
    vec4 col;

    bool boarder = IsBoarder(bs,0.0);
    boarder = boarder || IsBoarder(-bs,0.0);
    boarder = boarder || IsBoarder(0.0,bs);
    boarder = boarder || IsBoarder(0.0,-bs);
    
    boarder = boarder || IsBoarder(bs,-bs);
    boarder = boarder || IsBoarder(bs,bs);
    boarder = boarder || IsBoarder(-bs,-bs);
    boarder = boarder || IsBoarder(-bs,bs);
    
    if(boarder)
    {
        col = vec4(0,0,0,1) * texture2D( gm_BaseTexture, v_vTexcoord) * v_vColour;
        //col = vec4(0,0,0,1);
    }else{
        col = texture2D( gm_BaseTexture, v_vTexcoord) * v_vColour;
    }
    
    gl_FragColor = col;
}

bool IsBoarder(float x, float y)
{
    bool board = false;
    //board = texture2D( gm_BaseTexture, v_vTexcoord + vec2(1.0/image_size * x,1.0/image_size * y)).a <= bias && texture2D( gm_BaseTexture, v_vTexcoord).a > 0.0;
    board = board || (texture2D( gm_BaseTexture, v_vTexcoord).a < 1.0 && texture2D( gm_BaseTexture, v_vTexcoord).a > 0.0);
    return board;
}

