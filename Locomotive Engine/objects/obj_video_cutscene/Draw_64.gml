event_inherited();

var video_dat = video_draw();

if (videoType == video_format_rgba && surface_exists(video_dat[1])) 
{
    var video_xorigin = surface_get_width(video_dat[1]) / 2;
    var video_yorigin = surface_get_height(video_dat[1]) / 2;
    
    video_xorigin *= global.guiMaxScale;
    video_yorigin *= global.guiMaxScale;
    
    draw_surface_ext(video_dat[1], GuiCalcX(fa_center) - video_xorigin, GuiCalcY(fa_middle) - video_yorigin, global.guiMaxScale, global.guiMaxScale, 0, c_white, 1);
}
else
{
    var _surf = video_dat[1];
    var _chromasurf = video_dat[2];
    
    if (surface_exists(_surf) && surface_exists(_chromasurf))
    {
        shader_set(shd_yuv_video);
    
        var _tex_id = surface_get_texture(_surf);
        var _chroma_tex_id = surface_get_texture(_chromasurf);
        var videochromasampler = shader_get_sampler_index(shd_yuv_video, "v_chroma");
        texture_set_stage(videochromasampler, _chroma_tex_id);

        var _texfilter = gpu_get_texfilter();
        gpu_set_texfilter(false);
    
        draw_primitive_begin_texture(pr_trianglestrip, _tex_id);
        draw_vertex_texture(0, 0, 0, 0);
        draw_vertex_texture(surface_get_width(_chromasurf), 0, 1, 0);
        draw_vertex_texture(0, surface_get_height(_chromasurf), 0, 1);
        draw_vertex_texture(surface_get_width(_chromasurf), surface_get_height(_chromasurf), 1, 1);
        draw_primitive_end();
    
        gpu_set_texfilter(_texfilter);
        shader_reset();
    }
}

drawSkipTxt();