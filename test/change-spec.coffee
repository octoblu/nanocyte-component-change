ReturnValue = require 'nanocyte-component-return-value'
Change = require '../src/change'

describe 'Change', ->
  beforeEach ->
    @sut = new Change

  it 'should exist', ->
    expect(@sut).to.be.an.instanceOf ReturnValue

  describe '->onEnvelope', ->
    describe 'when called with an envelope', ->
      it 'should return the message', ->
        envelope =
          message: 'anything'

        expect(@sut.onEnvelope envelope).to.deep.equal 'anything'

    describe 'when called with an envelope with same data and message', ->
      it 'should return nothing', ->
        envelope =
          message: 'anything'
          data:    'anything'

        expect(@sut.onEnvelope envelope).not.to.exist
