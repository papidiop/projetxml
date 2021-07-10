<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema" exclude-result-prefixes="xs" version="1.0">
    <xsl:template match="/">
        <html>
            <head>
                <link type="text/css" rel="stylesheet" href="style.css"/>
            </head>
            <body>
                <div align="center">
                    <a href="http://localhost/XML/index.php">&#8592; liste des produits</a>
                    <form class="form">
                        <xsl:attribute name="action">index.php?action=ajout</xsl:attribute>
                        <xsl:attribute name="method">POST</xsl:attribute>
                       <h2>Formulaire d’ajout d’un produit :</h2>
					    <label for="id">Id :</label>
                        <input type="text" id='id' name='id' />
                        <br /><br />
                        <label for="name">Nom :</label>
                        <input type="text" id='name' name='name' />
                        <br /><br />
                        <label for="categories">Categorie :</label>
                        <input type="text" id='categories' name='categories'  />
                        <br /><br />
                        <label for="price">Prix :</label>
                        <input type="text" id='price' name='price'  />
                        <br /><br />
                        <label for="description">Description :</label>
                        <textarea rows='5' id='description' name='description'  />
                        <br /><br />
                        <label for="image">Image :</label>
                        <input type="text" id='image' name='image'  />
                        <br /><br />
                        <div class="btn-container">
                            <button type="reset">Annuler</button>
                            <button type="submit">Ajouter</button>
                        </div>
                    </form>
                </div>
            </body>
        </html>
    </xsl:template>
</xsl:stylesheet>