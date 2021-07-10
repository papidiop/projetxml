<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema" exclude-result-prefixes="xs" version="1.0">
    <xsl:template match="/">
        <html>
            <head>
                <link type="text/css" rel="stylesheet" href="style.css"/>
            </head>
            <body>
                <div class='container'>
                    <h2 align="center">liste produits</h2>
                    <table border="1">
                        <tr style="background-color:green">
                            <th style="text-align:center">Id</th>
                            <th style="text-align:center">Nom</th>
                            <th style="text-align:center">Categorie</th>
                            <th style="text-align:center">Price</th>
                            <th style="text-align:center">Description</th>
                            <th style="text-align:center">Photo</th>
                            <th style="text-align:center">Modifier</th>
                            <th style="text-align:center">Supprimer</th>
                        </tr>
                        <xsl:for-each select="products/product">

                            <tr>
                                <td>
                                    <xsl:value-of select="@id"/>
                                </td>
                                <td>
                                    <xsl:value-of select="name"/>
                                </td>
                                <td>
                                    <xsl:value-of select="categories"/>
                                </td>
                                <td>
                                    <xsl:value-of select="price"/>
                                </td>
                                <td>
                                    <xsl:value-of select="description"/>
                                </td>
                                <td>
                                    <img>
                                        <xsl:attribute name="style">width:100px</xsl:attribute>
                                        <xsl:attribute name="src">
                                            <xsl:value-of select="image"/>
                                        </xsl:attribute>
                                    </img>
                                </td>
                                <td>
                                    <a>
                                        <xsl:attribute name="href"> index.php?action=modif&amp;id=<xsl:value-of select="@id"/>
                                        </xsl:attribute>
                                    Modifier</a>
                                </td>
                                <td>
                                    <a>
                                        <xsl:attribute name="href"> index.php?action=supp&amp;id=<xsl:value-of select="@id"/>
                                        </xsl:attribute>
                                    Supprimer</a>
                                </td>
                            </tr>
                        </xsl:for-each>
                    </table>
                    <br/>
                    <a href="index.php?action=ajout">Ajouter un nouveau produit</a>
                    <div align="right">
                    <form method="POST" action="index.php">   
                        <label for="name">Recherche: </label>
                        <input type="text" name="name" placeholder="recherhce par nom, categorie,price..."/>
                        <!--<br/>-->
                        <label for="research"></label>  
					    <input type="submit" name="research" value="submit"/>
				    </form>
                    </div>
                </div>
            </body>
        </html>
    </xsl:template>
</xsl:stylesheet>
