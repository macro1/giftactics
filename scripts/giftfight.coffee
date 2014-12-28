---
---

class Fighter
  constructor: (@name) ->

class Gift
  constructor: ->
    @stolenCount = 0

angular.module "giftFight", []

.controller "CommandCtrl", [
  "$scope"
  ($scope) ->
    $scope.participants = []
    $scope.heldGifts = {}
    $scope.active = 0
    $scope.turn = 0

    $scope.addName = ->
      if not $scope.newName.length
        return
      $scope.participants.push $scope.newName
      $scope.newName = ""

    $scope.pickGift = ->
      $scope.heldGifts[$scope.active] = new Gift()
      $scope.turn += 1
      $scope.active = $scope.turn
      $scope.turnGifts = []

    $scope.stealGift = (from) ->
      if not $scope.heldGifts[from]
        $scope.warn "That person doesn't hold a gift"
        return
      if $scope.heldGifts[from].stolenCount >= 3
        $scope.warn "That gift is dead."
        return
      if $scope.turnGifts.indexOf($scope.heldGifts[from]) isnt -1
        $scope.warn "That gift was already stolen in this turn"
        return
      $scope.turnGifts.push $scope.heldGifts[from]
      $scope.heldGifts[$scope.active] = $scope.heldGifts[from]
      $scope.heldGifts[$scope.active].stolenCount += 1
      $scope.heldGifts[from] = undefined
      $scope.active = from

    $scope.warn = (message) ->
      alert message

]
