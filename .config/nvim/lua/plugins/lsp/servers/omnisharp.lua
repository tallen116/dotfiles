return function ()
   return { 
       cmd = { "dotnet", "/usr/lib/omnisharp-roslyn/OmniSharp.dll" },
       enable_editorconfig_support = true,
       enable_ms_build_load_projects_on_demand = false,
       enable_roslyn_analyzers = true,
       organize_imports_on_format = false,
       enable_import_completion = true,
       sdk_include_prereleases = true,
       analyze_open_documents_only = true,
   }
end
