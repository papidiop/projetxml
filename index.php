<?php
function afficherXml($xml, $xsl, $id = "")
{
    $xmlDoc = new DOMDocument();
    $xmlDoc->load($xml);

    $xslDoc = new DOMDocument();
    $xslDoc->load($xsl);

    $proc = new XSLTProcessor();
    $proc->importStyleSheet($xslDoc);

    $proc->setParameter('', 'id', $id);

    echo $proc->transformToXML($xmlDoc);
}

function addProduit($xml)
{
    $products = simplexml_load_file($xml);
    
    //$last_id = $products->attributes()->last_id + 1;

    if (
        isset($_POST['name']) &&
        isset($_POST['categories']) &&
        isset($_POST['price']) &&
        isset($_POST['description']) &&
        isset($_POST['image'])
    ) {
        $product = $products->addChild("product");
        $product->addAttribute("id", $_POST['id']);//$last_id);
        $product->addChild("name", $_POST['name']);
        $product->addChild("categories", $_POST['categories']);
        $product->addChild("price", $_POST['price']);
        $product->addChild("description", $_POST['description']);
        $product->addChild("image", $_POST['image']);

       // $products->attributes()->last_id = $last_id;
        $products->asXML($xml);
    }
}

function updateFile($xml, $id)
{
    $products = simplexml_load_file($xml);
    $i = 0;
    foreach ($products as $product) {
        if ($product->attributes()->id == $id) {
            if (
                isset($_POST['name']) &&
                isset($_POST['categories']) &&
                isset($_POST['price']) &&
                isset($_POST['description']) &&
                isset($_POST['image'])
            ) {
                $products->product[$i]->name = $_POST['name'];
                $products->product[$i]->categories = $_POST['categories'];
                $products->product[$i]->price = $_POST['price'];
                $products->product[$i]->description = $_POST['description'];
                $products->product[$i]->image = $_POST['image'];
            }

            $products->asXML($xml);
            break;
        }
        $i++;
    }
}

function suppProduit($xml, $id)
{
    $products = simplexml_load_file($xml);
    $i = 0;
    foreach ($products as $product) {
        if ($product->attributes()->id == $id) {
            unset($products->product[$i]);
            $products->asXML($xml);
            break;
        }
        $i++;
    }
}

if (!isset($_REQUEST["action"])) {

    afficherXml("tool.xml", "stylesxsl.xsl");

} elseif ($_REQUEST["action"] == "ajout") {

    if (count($_POST) === 0) {
        afficherXml("tool.xml", "formAjout.xsl");
    } else {
        addProduit("tool.xml");
        afficherXml("tool.xml", "stylesxsl.xsl");
    }

} elseif ($_REQUEST["action"] == "modif") {

    $id = $_REQUEST["id"];
    if (count($_POST) === 0) {
        afficherXml("tool.xml", "formModif.xsl", $id);
    } else {
        updateFile("tool.xml", $id);
        afficherXml("tool.xml", "stylesxsl.xsl");
    }

} else {

    $id = $_REQUEST["id"];
    suppProduit("tool.xml", $id);
    afficherXml("tool.xml", "stylesxsl.xsl");

}


//recherche

function chercherProd($xml){
    if(isset($_POST['research']))
        {
            $nom = $_POST['name'];
            $products = simplexml_load_file($xml);
            foreach($products->product as $product)
            {
                if(($product->name == $nom) || ($product['id'] == $nom) || ($product->categories == $nom)|| ($product->price == $nom)) 
                { 
                        
                     $id=$product['id'];
                        echo "$product".
                        "<table>".
                                "<tr>"."<th>"."Id"."</th>".
                                        "<th>"."Name"."</th>".
                                        "<th>"."Categorie"."</th>".
                                        "<th>"."Price"."</th>".
                                        "<th>"."Description"."</th>".
                                        "<th>"."Photo"."</th>".
                                "</tr>".

                                "<tr>"."<td>"."$id"."</td>".
                                        "<td>"."$product->name"."</td>".
                                        "<td>"."$product->categories"."</td>".
                                        "<td>"."$product->price"."</td>".
                                        "<td>"."$product->description"."</td>".
                                        "<td>"."$product->image"."</td>".
                                "</tr>".
                        "</table>";
                        break;
                }
            }
        }
}
chercherProd('tool.xml'); 