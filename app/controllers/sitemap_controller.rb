class SitemapController < ApplicationController
    def main
        # Path to the file in your assets folder
        file_path = Rails.root.join('app', 'assets', 'stylesheets', 'sitemap.xml')

        if File.exist?(file_path)
            sitemap_content = File.read(file_path)
            
            send_data sitemap_content, 
                    type: 'application/xml', 
                    disposition: 'inline'
        else
            render plain: "Sitemap not found", status: :not_found
        end
    end
end