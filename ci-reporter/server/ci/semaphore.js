import SemaphoreCI from 'node-semaphoreci'

export default class SemaphoreStatus {
  constructor({ branchName = 'master' } = {}) {
    this.api = new SemaphoreCI({
      api_url: 'http://semaphoreci.com/api/v1',
      project_hash: process.env.SEMAPHORE_PROJECT_HASH,
      auth_token: process.env.SEMAPHORE_AUTH_TOKEN
    })

    this.branchName = branchName
  }

  check() {
    return this.api
      .getBranchStatus({ branch_name: this.branchName })
      .then(({ data: { result }}) => result)
      .catch(({ data: { error } }) => {
        console.error(`Error: ${error}`)
      })
  }
}
