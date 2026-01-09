# app/services/certificate_generator.rb
require "prawn"
require "prawn/templates"

class PdfGenerator
  def self.call(student_name, course_name)
    template_path = Rails.root.join("app", "assets", "pdf_assets", "certificate.pdf")
    output_path = Rails.root.join("app", "assets", "pdf_assets", "certificate_final.pdf")
    Prawn::Document.generate(output_path, template: template_path) do |pdf|
      # Ensure we are targeting the first page of the template
      pdf.go_to_page(1)

      # 1. Add the Student Name
      pdf.font "Helvetica", style: :bold
      pdf.font_size 30
      pdf.draw_text student_name, at: [260, 320]

      # 2. Add the Course Name
      pdf.font "Helvetica", style: :italic
      pdf.font_size 24
      pdf.draw_text course_name, at: [260, 220]
    end

    output_path
  end
end
