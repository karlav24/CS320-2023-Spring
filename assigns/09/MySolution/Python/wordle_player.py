########################
# HX-2023-04-15: 20 points
########################
"""
Given a history of wordle hints, this function returns a
word as the player's guess.
"""
########################################################################
def wordle_guess(hints):
    word = ['_'] * len(hints[0])
    avail = set('abcdefghijklmnopqrstuvwxyz')
    dbl = set()

    for hint in hints:
        for index, (pos, char_guess) in enumerate(hint):
            if pos == 1:
                word[index] = char_guess
            elif pos == 2:
                dbl.add((index, char_guess))
            else:
                avail.discard(char_guess)

    result = ""
    for char in word:
        result += char

    return result
########################################################################
