// Shader untuk menampilkan texture Albedo sederhana
shader_type spatial;

// Albedo properties
uniform sampler2D texture_albedo; // Texture utama yang akan ditampilkan

void fragment() {
    // Ambil warna dari texture menggunakan koordinat UV standar
    vec4 albedo_tex = texture(texture_albedo, UV);
    
    // Tetapkan warna texture ke Albedo
    ALBEDO = albedo_tex.rgb;
}
