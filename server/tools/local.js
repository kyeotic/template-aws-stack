'use strict'

require('dotenv').config()
const { wrapContext } = require('../src/context')

const context = wrapContext()

async function main() {
  let { dietStore } = context
  let rows = await dietStore.getAll()
  console.log(rows)
}

main().catch(e => console.error(e))
