import vim
from translate import Translator

def main():
	word = vim.eval("s:word")
	translator = Translator(to_lang="ru")
	print translator.translate(word)


if __name__ == "__main__":
	main()
