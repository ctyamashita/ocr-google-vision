# README

Things you need to setup first:

* [Create Google Cloud Project](https://console.cloud.google.com/)

* [Enable Google Vision API](https://console.cloud.google.com/apis/)

* [Create a service account](https://console.cloud.google.com/iam-admin/serviceaccounts)

* Generate a key:
  - On the sidebar menu at Google Cloud Console on [IAM & Admin](https://console.cloud.google.com/iam-admin/)
  - Go to [Service Accounts](https://console.cloud.google.com/iam-admin/serviceaccounts), click on the service account created
  - Click on [KEYS] tab > [Add new Key] > [Create new key] > Create a Key type JSON
  - A json file will be download
  - create a .env file on the rails project folder
  - add to the .env -> `VISION_CREDENTIALS="$_JSON_CONTENT_$"`

* run `bundle install`

* run `rails s`

Important Files to check:
  - [app/controllers/pages_controller.rb](https://github.com/ctyamashita/ocr-google-vision/blob/master/app/controllers/pages_controller.rb)
  - [app/views/pages](https://github.com/ctyamashita/ocr-google-vision/tree/master/app/views/pages)
  - [config/routes.rb](https://github.com/ctyamashita/ocr-google-vision/blob/master/config/routes.rb)
  - [app/javascript/controllers/send_image_controller.js](https://github.com/ctyamashita/ocr-google-vision/blob/master/app/javascript/controllers/send_image_controller.js)
