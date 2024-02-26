require 'open-uri'
require "google/cloud/vision"

class Ocr
  def self.extract_text(image_file)
    # on your .env file define -> VISION_CREDENTIALS="{\"type\": \"service_account\",\"project_id\": \"project_name...

    Google::Cloud::Vision.configure do |config|
      config.credentials = JSON.parse(ENV.fetch('VISION_CREDENTIALS'))
    end
    client = Google::Cloud::Vision.image_annotator

    image = client.text_detection(image: image_file)
    text = image.responses.first.text_annotations.first.description.split("\n").map(&:downcase).map(&:capitalize)
  end
end
