import wikipediaapi
from translate import Translator

def get_wikipedia_content(article_title, lang='en'):
    wiki_wiki = wikipediaapi.Wikipedia(lang)
    page_py = wiki_wiki.page(article_title)
    
    if not page_py.exists():
        raise ValueError(f"Wikipedia page '{article_title}' does not exist in the specified language.")

    return page_py.text

def translate_text(text, target_language='es'):
    translator = Translator(to_lang=target_language)
    translated_text = translator.translate(text)
    return translated_text

def translate_wikipedia_article(article_title, target_language='es'):
    # Get the content of the Wikipedia article in English
    article_content = get_wikipedia_content(article_title)

    # Translate the article content to the target language
    translated_content = translate_text(article_content, target_language)

    return translated_content

if __name__ == "__main__":
    # Example: Translate the English Wikipedia article on "Python (programming language)" to Spanish
    article_title = "Python (programming language)"
    target_language = 'es'

    try:
        translated_article = translate_wikipedia_article(article_title, target_language)

        print(f"Original article ({article_title}):")
        print(get_wikipedia_content(article_title))
        print("\nTranslated article:")
        print(translated_article)

    except ValueError as e:
        print(f"Error: {e}")
