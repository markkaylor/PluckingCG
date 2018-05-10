class MyMailer < ApplicationMailer
  def sendgrid_client
    @sendgrid_client ||= SendGrid::API.new(api_key: "")
  end

  def new_user(user)
    template_id = "template_id_of_new_user"

    data = {
      "personalizations": [
        {
          "to": [
            {
              "email": user.email
            }
          ],
          "substitutions": {
            "-name-": "USER_NAME",
            "-content-": user.name
          },
          "subject": "Welcome to Plucking Classical Guitar"
        }
      ],
      "from": {
        "email": ""
      },
      "template_id": "028d37ca-0b24-4aef-951e-ca2579defda2"
    }

    sendgrid_client.client.mail._("send").post(request_body: data)
  end
end
