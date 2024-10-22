

from selenium import webdriver
from selenium.webdriver.chrome.service import Service
from selenium.webdriver.common.by import By
from selenium.webdriver.chrome.options import Options

# Configurer les options de Chrome
chrome_options = Options()
chrome_options.add_argument("--headless")  # Exécuter Chrome en mode headless (sans interface graphique)
chrome_options.add_argument("--no-sandbox")
chrome_options.add_argument("--disable-dev-shm-usage")
chrome_options.binary_location = "/usr/bin/google-chrome"  # Spécifier le chemin du binaire de Chrome

# Spécifier le chemin vers le ChromeDriver
chrome_driver_path = "/usr/local/bin/chromedriver"

# Initialiser le service ChromeDriver
service = Service(chrome_driver_path)

# Initialiser le WebDriver
driver = webdriver.Chrome(service=service, options=chrome_options)

# Naviguer vers la page web
url = "https://www.example.com"
driver.get(url)

# Extraire le contenu de la page
page_content = driver.page_source

# Afficher le contenu de la page
print(page_content)

# Fermer le navigateur
driver.quit()