# coding: utf-8

desc "Manage the encoding header of Ruby files"
task :encoding => :environment do
  files = Array.new
  ["*.rb", "*.rake"].each do |extension|
    files.concat(Dir[ File.join(Dir.getwd.split(/\\/), "**", extension) ])
  end

  files.each do |file|
    content = File.read(file)
    next if content[0..16] == "# coding: utf-8\n\n"

    ["\n\n", "\n"].each do |file_end|
      content = content.gsub(/(# encoding: utf-8#{file_end})|(# coding: utf-8#{file_end})|(# -*- coding: utf-8 -*-#{file_end})/i, "")
    end

    new_file = File.open(file, "w")
    new_file.write("# coding: utf-8\n\n"+content)
    new_file.close
  end
end