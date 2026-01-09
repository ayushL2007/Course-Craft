# app/services/certificate_generator.rb
class PdfGenerator
  def self.call(original_pdf_path, output_path, student_name, course_name)
    # We use Prawn with the original certificate as a 'template'
    Prawn::Document.generate(output_path, template: original_pdf_path) do |pdf|

      # 1. Add the Student Name
      pdf.font "Helvetica", style: :bold
      pdf.font_size 24
      # Adjust [x, y] based on your certificate design
      pdf.draw_text student_name, at: [150, 450] 

      # 2. Add the Course Name
      pdf.font "Helvetica", style: :italic
      pdf.font_size 18
      # Lower Y value moves the text down
      pdf.draw_text course_name, at: [150, 380]
    end
  end
end
