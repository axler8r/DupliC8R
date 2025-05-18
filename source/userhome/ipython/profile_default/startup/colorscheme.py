from IPython.terminal.prompts import Prompts, Token
from pygments.style import Style
from pygments.token import (
    Keyword,
    Name,
    Comment,
    String,
    Error,
    Number,
    Operator,
    Generic,
)


class SolarizedStyle(Style):
    background_color = "#002b36"  # dark blue (base03)
    highlight_color = "#073642"   # darker blue (base02)

    styles = {
        Comment: "#586e75",       # base01
        Keyword: "#859900",       # green
        Name: "#268bd2",          # blue
        Name.Function: "#268bd2", # blue
        Name.Class: "#b58900",    # yellow
        String: "#2aa198",        # cyan
        Number: "#cb4b16",        # orange
        Operator: "#657b83",      # base00
        Error: "#dc322f",         # red
        Generic: "#839496",       # base0
    }


class SolarizedPrompt(Prompts):
    def in_prompt_tokens(self, cli=None):
        return [
            (Token.Prompt, "["),
            (Token.PromptNum, str(self.shell.execution_count)),
            (Token.Prompt, "]  "),
        ]

    def continuation_prompt_tokens(self, cli=None, width=None):
        if width is None:
            width = self._width()

        return [
            (Token.Prompt, (" " * (width - 2)) + " "),
        ]

    def out_prompt_tokens(self, cli=None):
        return [
            (Token.OutPrompt, "["),
            (Token.OutPromptNum, str(self.shell.execution_count)),
            (Token.OutPrompt, "]  "),
        ]


# Apply the custom style and prompt
get_ipython().highlighting_style = SolarizedStyle
get_ipython().prompts = SolarizedPrompt(get_ipython())

