ReturnValue = require 'nanocyte-component-return-value'
_ = require 'lodash'

class Change extends ReturnValue
  onEnvelope: (envelope) =>
    {data,message,config} = envelope

    dataCheck = _.get data, config.key
    messageCheck = _.get message, config.key

    return if _.isEqual dataCheck, messageCheck
    return message

module.exports = Change
