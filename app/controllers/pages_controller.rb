require 'open-uri'

class PagesController < ApplicationController
  def home
    @text = params[:text]
  end

  def scan
    require "google/cloud/vision"
    # on your .env file define -> VISION_CREDENTIALS="{\"type\": \"service_account\",\"project_id\": \"project_name...

    Google::Cloud::Vision.configure do |config|
      config.credentials = JSON.parse(ENV.fetch('VISION_CREDENTIALS'))
    end
    client = Google::Cloud::Vision.image_annotator
    image_file = params[:image_file].tempfile

    image = client.text_detection(image: image_file)
    text = image.responses.first.text_annotations.first.description.split("\n").map(&:downcase).map(&:capitalize)

    respond_to do |format|
      format.html # Follow regular flow of Rails
      format.json { render partial: "pages/ingredients", locals: { text: text }, formats: [:html] }
    end
  end
end
