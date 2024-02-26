require 'open-uri'

class PagesController < ApplicationController
  def home
    @text = params[:text]
  end

  def scan
    image_file = params[:image_file].tempfile
    text = Ocr.extract_text(image_file)

    respond_to do |format|
      format.html # Follow regular flow of Rails
      format.json { render partial: "pages/ingredients", locals: { text: text }, formats: [:html] }
    end
  end
end
