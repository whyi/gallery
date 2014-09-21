"use strict"

angular.module("app.filters", [])

.filter "partition", ->
  _evenRows = (arr, cols) ->
    rowsArr = _.clone(arr)
    rows = Math.ceil rowsArr.length/cols
    emptySlots = cols - (arr.length % cols)
    if (emptySlots % cols) != 0
      for slot in [1..emptySlots]
        rowsArr.splice(((cols - emptySlots + slot) * rows) - 1, 0, null)
    rowsArr

  _toHorizontalOrderMatrix = (arr, cols) ->
    rowsArr = []
    arr = _evenRows(arr, cols)
    rows = Math.ceil arr.length/cols
    for row in [1..rows]
      rowArr = []
      for el, i in arr
        if ((i+1) % rows) == row
          rowArr.push el
        else if (((i+1) % rows) == 0) && (row == rows)
          rowArr.push el
      rowsArr.push _.compact(rowArr)
    rowsArr

  _toVerticalOrderMatrix = (arr, cols) ->
    rowsArr = []
    i = 0
    while i < arr.length
      rowsArr.push arr.slice(i, i + cols)
      i += cols
    rowsArr

  cache = {}

  _filter = (arr, size, hOrder) ->
    return  unless arr

    horizontalOrder = true
    if typeof (hOrder) isnt "undefined"
      horizontalOrder = hOrder

    rowsArr = []
    if horizontalOrder
      rowsArr = _toHorizontalOrderMatrix arr, size
    else
      rowsArr = _toVerticalOrderMatrix arr, size

    arrString = JSON.stringify(arr)
    fromCache = cache[arrString + size]
    return fromCache  if JSON.stringify(fromCache) is JSON.stringify(rowsArr)
    cache[arrString + size] = rowsArr
    rowsArr

  _filter