declare option saxon:output "indent=yes";

<liste-des-UEs> {
    for $x in doc("master.xml")/Master/Intervenants/Intervenant
		for $y in doc("master.xml")/Master/Parcours
			for $z in $y/Semestre/Bloc/UE
				where $x/@id=$z/ref-Intervenant/@ref
				return 
					<Intervenant>
						
						{$x/nom}
						<Parcours>{$y/nom}</Parcours>
						<UE>{$z/nom}</UE>
						
					</Intervenant>
} </liste-des-UEs>
