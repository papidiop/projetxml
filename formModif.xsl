<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema" exclude-result-prefixes="xs" version="1.0">
    <xsl:template match="/">
        <html>
            <head>
                <link type="text/css" rel="stylesheet" href="cd_catalog.css"/>
            </head>
            <body>
                <div class="container">
                    <a href="http://localhost/XML/index.php">&#8592; liste des produits</a>
                    <xsl:for-each select="products/product[@id=$id]">
                        <form class='form'>
                            <xsl:attribute name="action">index.php?action=modif&amp;id=<xsl:value-of select="@id"/>
                            </xsl:attribute>
                            <xsl:attribute name="method">POST</xsl:attribute>
                            <h2>Formulaire d’edition du produit :<xsl:value-of select="@id"/></h2>
                            <div class="img">
                                <img>
                                    <xsl:attribute name="style">width:50px</xsl:attribute>
                                    <xsl:attribute name="src">
                                        <xsl:value-of select="image"/>
                                    </xsl:attribute>
                                </img>
                            </div>
                            <label for="name">Nom :</label>
                            <input type="text" id='name' name='name'  >
                                <xsl:attribute name="value">
                                    <xsl:value-of select="name"/>
                                </xsl:attribute>
                            </input>
                            <label for="categories">categories :</label>
                            <input type="text" id='categories' name='categories'  >
                                <xsl:attribute name="value">
                                    <xsl:value-of select="categories"/>
                                </xsl:attribute>
                            </input>
                            <label for="price">Prix :</label>
                            <input type="text" id='price' name='price'  >
                                <xsl:attribute name="value">
                                    <xsl:value-of select="price"/>
                                </xsl:attribute>
                            </input>

                            <label for="image">Image :</label>
                            <input type="text" id='image' name='image'  >
                                <xsl:attribute name="value">
                                    <xsl:value-of select="image"/>
                                </xsl:attribute>
                            </input>
                            <label for="description">Description :</label>
                            <textarea rows='5' id='description' name='description'  >
                                <xsl:value-of select="description"/>
                            </textarea>
                            <div class="btn-container">
                                <button type="reset">Annuler</button>
                                <button type="submit">Modifier</button>
                            </div>
                        </form>
                    </xsl:for-each>
                </div>
            </body>
        </html>
    </xsl:template>
</xsl:stylesheet>