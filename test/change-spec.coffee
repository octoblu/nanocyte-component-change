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
          config: key: 0
          data: {}

        expect(@sut.onEnvelope envelope).to.deep.equal 'anything'

    describe 'when called with an envelope with same data and message', ->
      it 'should return nothing', ->
        envelope =
          message: 'anything'
          config: key: 0
          data:    'anything'

        expect(@sut.onEnvelope envelope).not.to.exist

    describe 'when called with an envelope containing deeply equal data and message', ->
      it 'should return nothing', ->
        envelope =
          message:
            root:
              something: 'with-booze'
          config: key: 'root.something'
          data:
            root:
              something: 'with-booze'

        expect(@sut.onEnvelope envelope).not.to.exist

    describe 'when called with an envelope containing not deeply equal data and message', ->
      it 'should return the message', ->
        envelope =
          message:
            root:
              something: 'with-booze'
          config: key: 'root.something'
          data:
            root:
              something: 'without-booze'

        expect(@sut.onEnvelope envelope).to.deep.equal root: something: 'with-booze'
