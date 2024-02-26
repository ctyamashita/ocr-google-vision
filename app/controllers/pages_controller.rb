class PagesController < ApplicationController
  def home
    require "google/cloud/vision/v1"
    client = ::Google::Cloud::Vision::V1::ProductSearch::Client.new do |config|
      config.credentials = 'decoded-core-415502-dc9a34b903cb.json'
    end
    vision = Google::Cloud::Vision.image_annotator
    image = vision.text_detection(image: URI.open('/assets/images/ingredients.jpeg'))
    text = image.responses.first.text_annotations.first.description.split("\n").map(&:downcase).map(&:capitalize)
    raise
  end
end
