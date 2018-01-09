import dotenv from 'dotenv'
import Particle from 'particle-api-js'
import SemaphoreStatus from './ci/semaphore'

dotenv.config()

console.info('CI Reporter script booting up...')

const particle = new Particle()

particle.login({
  username: process.env.PARTICLE_EMAIL,
  password: process.env.PARTICLE_PASSWORD
}).then(({ body: { access_token: token }}) => {
  const ciChecker = new SemaphoreStatus()

  const check = () => {
    console.info('Checking master...')
    ciChecker.check().then(status => {
      console.info(`Latest status: ${status}`)
      particle.publishEvent({
        name: 'buildStatus',
        data: status,
        auth: token
      })
    })
  }

  check()
  setInterval(check, 10000)
})
