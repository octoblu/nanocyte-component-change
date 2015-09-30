ReturnValue = require 'nanocyte-component-return-value'

class Change extends ReturnValue
  onEnvelope: (envelope) =>
    return envelope.message

module.exports = Change
