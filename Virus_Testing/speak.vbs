Dim message, sapi
message = "Warning! Your computer has been hacked, the C drive will be deleted shortly. Anyways, good luck with the remaining time of your device!"
Set sapi=CreateObject("sapi.spvoice")
sapi.Speak message
