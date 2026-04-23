-- This adds color swatches to color codes in text
--
return {
  {
    "catgoose/nvim-colorizer.lua",
    event = "BufReadPre",
    opts = {
      user_default_options = {
        names = false,
      },
    },
  },
}
