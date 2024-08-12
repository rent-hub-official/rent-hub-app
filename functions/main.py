import json
from firebase_functions import https_fn
from firebase_admin import initialize_app
from firebase_admin import messaging

initialize_app()

@https_fn.on_request()
def send_notification(req: https_fn.Request) -> https_fn.Response:
    try:
        user_token = req.args.get("token")

        if user_token is None:
            return https_fn.Response("No token provided")

        request_json = req.get_json(silent=True)
        if request_json is None:
            payload = {} 
        else:
            payload = request_json
            request_json['payload'] = json.dumps(payload.get('payload', {}))

        message = messaging.Message(
            data=payload,
            token=user_token,
        )

        # Send a message to the device corresponding to the provided
        # registration token.
        response = messaging.send(message)
        # Response is a message ID string.

        return https_fn.Response("Message sent successfully. Message ID: " + response)
    
    except Exception as e:

        return https_fn.Response(f"An error occurred {e}")
    