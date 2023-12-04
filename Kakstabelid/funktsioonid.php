<?php
require ('conf.php');

//tabeli Inimene täitmine
function lisaInimene($eesnimi, $perekonnanimi, $maakond_id){
    global $yhendus;
    $paring = $yhendus->prepare("INSERT INTO inimene(eesnimi,perekonnanimi,maakond_id) values(?,?,?)");
    $paring->bind_param("ssi", $eesnimi, $perekonnanimi, $maakond_id);
    $paring->execute();
}

//tabeli Maakond täitmine
    function lisaMaakond($maakond_nimi){
        global $yhendus;
        $paring=$yhendus->prepare("INSERT INTO maakond(maakond_nimi) values(?)");
        $paring->bind_param("s",$maakond_nimi);
        $paring->execute();
}

// rippLoend tabelist maakonnad
function selectLoend($paring, $nimi){
    global $yhendus;
    $paring=$yhendus->prepare($paring);
    $paring->bind_result($id, $andmed);
    $paring->execute();
    $tulemus="<select name='$nimi'>";
    while($paring->fetch()){
        $tulemus.="<option value='$id'>$andmed</option>";
    }
    $tulemus.="</select>";
    return $tulemus;
}

function inimesteKuvamine($sort="", $otsisona=""){
    global $yhendus;
    $sort_list = array("eesnimi", "perekonnanimi", "maakond_nimi");
    if(!in_array($sort, $sort_list)) {
        return "Seda tulpa ei saa sorteerida";
    }
    $paring = $yhendus->prepare("SELECT inimene.id, eesnimi, perekonnanimi, maakond.maakond_nimi FROM inimene, maakond  WHERE inimene.maakond_id = maakond.id AND (eesnimi LIKE '%$otsisona%' OR perekonnanimi LIKE '%$otsisona%' OR maakond_nimi LIKE '%$otsisona%') ORDER by $sort");
    $paring->bind_result($id, $eesnimi, $perekonnanimi, $maakond_nimi);
    $paring->execute();
    $andmed = array();
    while($paring->fetch()) {
        $inimene = new stdClass();
        $inimene->id = $id;
        $inimene->eesnimi = htmlspecialchars($eesnimi);
        $inimene->perekonnanimi = htmlspecialchars($perekonnanimi);
        $inimene->maakond_nimi = $maakond_nimi;
        array_push($andmed, $inimene);
    }
    return $andmed;
}