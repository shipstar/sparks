// Redacting these for commit
var particle = {
  username: '',
  password: '',
  deviceId: ''
}

var particle = new Particle()
var token

particle.login({
  username: particle.username,
  password: particle.password
}).then(function(data) {
  token = data.body.access_token
})

var recognition = new webkitSpeechRecognition()
recognition.onresult = function(event) {
  var command = event.results[0][0].transcript
  console.warn(command)

  var funcName
  // Not just assigning command because I'll probably
  // add more over time.
  switch (command.toLowerCase()) {
    case 'turn led on':
      funcName = 'on'
      break

    case 'turn led off':
      funcName = 'off'
      break

    default:
      funcName = 'confused'
      break
  }

  console.warn('Calling ', funcName)
  particle.callFunction({
    deviceId: particle.deviceId,
    name: funcName,
    auth: token
  })
}

function recognizeSpeech() {
  recognition.start();
}

function changeBlinkSpeed(val) {
  particle.callFunction({
    deviceId: particle.deviceId,
    name: 'changeBlink',
    argument: val.toString(),
    auth: token
  }).then(function (_data) {
    document.getElementById('blink-speed').value = val
  })
}
