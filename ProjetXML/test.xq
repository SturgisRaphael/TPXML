declare option saxon:output "indent=yes";

<liste-des-UEs> {
    for $x in doc("master.xml")/Master/Parcours
		for $y in $x/Semestre/Bloc/UE
		return 
			<item>
			    
			    <Intervenant>{$y/ref-Intervenant/@ref} </Intervenant>
			    <Parcours>{doc("master.xml")/Master/Parcours/@id} </Parcours>
				{$y/nom}
			</item>
} </liste-des-UEs>
