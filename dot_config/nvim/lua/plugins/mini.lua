-- Making sure that surround does not add spaces when it puts in (), {} or []
return {
  "mini.surround",
  opts = {
    custom_surroundings = {
      ["("] = {
        input = { "%b()", "^.().*().$" }, -- Detect existing parentheses
        output = { left = "(", right = ")" }, -- No spaces
      },
      ["{"] = {
        input = { "%b{}", "^.().*().$" },
        output = { left = "{", right = "}" },
      },
      ["["] = {
        input = { "%b[]", "^.().*().$" },
        output = { left = "[", right = "]" },
      },
    },
  },
}
