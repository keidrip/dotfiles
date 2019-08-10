call lexima#add_rule({'char': ')', 'at': '\%#)', 'input': '<Right>'})
call lexima#add_rule({'char': ')', 'at': '.*\%#)', 'input': '<Right>'})
call lexima#add_rule({'char': '"', 'at': '\%#"', 'input': '<Right>'})
call lexima#add_rule({'char': '"', 'at': '.*\%#"', 'input': '<Right>'})
call lexima#add_rule({'char': '<', 'input_after': '>'})
call lexima#add_rule({'char': '>', 'at': '\%#>', 'input': '<Right>'})
call lexima#add_rule({'char': '>', 'at': '.*\%#>', 'input': '<Right>'})


