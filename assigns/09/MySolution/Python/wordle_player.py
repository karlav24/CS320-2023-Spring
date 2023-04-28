########################
# HX-2023-04-15: 20 points
########################
"""
Given a history of wordle hints, this function returns a
word as the player's guess.
"""
########################################################################
import nltk
nltk.download('words')
from nltk.corpus import words

def dfs(start_nodes, get_next_nodes):
    visited_nodes = set()
    stack = []
    results = []

    for node in start_nodes:
        stack.append(node)
        visited_nodes.add(node)

    while stack:
        current_node = stack.pop()
        results.append(current_node)

        for next_node in reversed(get_next_nodes(current_node)):
            if next_node not in visited_nodes:
                stack.append(next_node)
                visited_nodes.add(next_node)

    return results


def get_next_nodes(node, letter_set):
    result = []
    try:
        index = node.index("$")
        for letter in letter_set:
            result.append(node[:index] + letter + node[index+1:])
        return result
    except ValueError:
        return []

def wordle_guess(hints):
    guessed_word = "$" * len(hints[0])
    letter_bank = set("abcdefghijklmnopqrstuvwxyz")
    incorrect_guesses = set()
    included_letters = []

    for hint in hints:
        for i, letter_info in enumerate(hint):
            if letter_info[0] == 1:
                guessed_word = guessed_word[:i] + letter_info[1] + guessed_word[i+1:]
            elif letter_info[0] == 2:
                incorrect_guesses.add((i, letter_info[1]))
                included_letters += letter_info[1]
            elif letter_info[0] == 0:
                letter_bank.discard(letter_info[1])

    def is_word_safe(word, incorrect_set, included_list):
        for i, letter in enumerate(word):
            if (i, letter) in incorrect_set:
                return False
        for letter in included_list:
            if letter not in word:
                return False
        return "$" not in word and word in words.words()

    if "$" not in guessed_word:
        return guessed_word

    valid_guesses = dfs([guessed_word], lambda x: get_next_nodes(x, included_letters))

    for word in valid_guesses:
        if is_word_safe(word, incorrect_guesses, included_letters):
            return word

    return guessed_word
########################################################################
