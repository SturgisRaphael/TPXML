declare option saxon:output "indent=yes";

<liste-des-UEs> {
    for $x in doc("master.xml")/Master/Intervenants/Intervenant
        return
            <Intervenant>
       			{$x/nom}
		for $y in doc("master.xml")/Master/Parcours
		    return
				<Parcours>{$y/nom}</Parcours>
			for $z in $y/Semestre/Bloc/UE
				where $x/@id=$z/ref-Intervenant/@ref
				return
					<UE>{$z/nom}</UE>
		return
			</Intervenant>
} </liste-des-UEs>
