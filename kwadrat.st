"
Run in intearctive mode:
	FileStream fileIn: 'kwadrat.st'.
"

Object subclass: #Wielokat
	instanceVariableNames: 'wierzcholki nazwa '
	classVariableNames: ''
	poolDictionaries: ''
	category: 'JezykiProgramowania'!

	!Wielokat methodsFor: 'initialize-release'!

		initialize: liczbaWierzcholkow
			"konstruktor obiektu - wielokata"
			nazwa:=(self class name).
			wierzcholki:=Array new: liczbaWierzcholkow.
			wierzcholki at: 1 put: 0@0.!

		initialize: liczbaWierzcholkow name: nowaNazwa
			"konstruktor obiektu - wielokata"
			nazwa:=nowaNazwa.
			wierzcholki:=Array new: liczbaWierzcholkow.
			wierzcholki at: 1 put: 0@0.! !

	!Wielokat methodsFor: 'actions'!
	    
	    srodekGeometryczny
	        "licz geometryczny srodek wielokata"
	        
	        | sumaX sumaY liczbaWierzcholkow |
	        sumaX := 0.
	        sumaY := 0.
	        liczbaWierzcholkow := wierzcholki size.
	        
	        wierzcholki do: [:wierzcholek | sumaX := sumaX + wierzcholek x. sumaY := sumaY + wierzcholek y.].
	       
	       ^ (sumaX / liczbaWierzcholkow) @ (sumaY / liczbaWierzcholkow).! !
	       ^ (sumaX / liczbaWierzcholkow) @ (sumaY / liczbaWierzcholkow).!
		
		skaluj: skala
	        "skaluje wielokat w okol jego srodka geometrycznego"
	        
	        | srodek |
	        srodek := self srodekGeometryczny.
	        wierzcholki := wierzcholki collect: [:wierzcholek |
	            | sX sY |
	            sX := (wierzcholek x - srodek x) * skala + srodek x.
	            sY := (wierzcholek y - srodek y) * skala + srodek y.
	            sX @ sY.
	        ].! !

	!Wielokat methodsFor: 'accessing'!

		nazwa
			"podaje nazwe wielokata"

			^nazwa!

		nazwa: nowa_nazwa
			"ustawia nowa nazwe wielokata"

			nazwa:=nowa_nazwa! !

	!Wielokat methodsFor: 'printing'!

		drukuj
			"drukuje zmienne wielokata"

			Transcript show: 'Wielokat: ', self nazwa; cr;
					tab; show: 'Wierzcholki: '.
			wierzcholki do: [:wierzcholek | Transcript show: wierzcholek printString; space.].
			Transcript cr; tab; show: 'Pole: ', self pole printString; cr.
			Transcript tab; show: 'srodekGeometryczny: ', self srodekGeometryczny printString; cr.! !

Wielokat subclass: #TrojkatRownoboczny
	instanceVariableNames: 'bok'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'JezykiProgramowania'!

	!TrojkatRownoboczny methodsFor: 'initialize-release'!

		initialize: aBok
			"tworz trojkat o podanym boku"
			bok:=aBok.
			super initialize: 3 .
			wierzcholki at: 2 put: bok@0.
			wierzcholki at: 3 put: ( bok / 2 )@(self wysokosc).! !

	!TrojkatRownoboczny methodsFor: 'arithmetic'!

		+ figura
			"dodaj 2 figury w sensie pola"

			| pole bok |
			pole:=self pole + figura pole.
			bok:=(4 * pole / 3 asFloatE sqrt) sqrt.
			^(TrojkatRownoboczny new) initialize: bok! !

	!TrojkatRownoboczny methodsFor: 'actions'!

		wysokosc
			"licz wysokosc trojkata"

			^bok * 3 asFloatE sqrt / 2!
			" ^(wierzcholki at: 2) x * 3 asFloatE sqrt / 2! "

		pole
			"licz pole trojkata"
			^bok squared * 3 asFloatE sqrt / 4! !
			^bok squared * 3 asFloatE sqrt / 4!
			" ^(wierzcholki at: 2) x squared * 3 asFloatE sqrt / 4! ! "
		
		skaluj: skala
		    "skaluje trojkat i aktualizuje bok"
		    super skaluj: skala.
		    bok := bok * skala.! !

	!TrojkatRownoboczny methodsFor: 'printing'!

		drukuj
			"drukuje zmienne trojkata"
			super drukuj.
			Transcript tab; show: 'Wysokosc: ', self wysokosc printString; cr.
			Transcript tab; show: 'Bok: ', bok printString; cr.! !

Wielokat subclass: #Kwadrat
	instanceVariableNames: ''
	instanceVariableNames: 'bok'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'JezykiProgramowania'!

	!Kwadrat methodsFor: 'arithmetic'!

		+ figura
			"dodaj 2 figury w sensie pola"

			| p |

			p:=self pole + figura pole.
			^(Kwadrat new) initialize: p asFloatE sqrt! !

	!Kwadrat methodsFor: 'actions'!

		pole
			"licz pole kwadratu"

			^(wierzcholki at: 2) x asFloatE squared! !
			^(wierzcholki at: 2) x asFloatE squared!
		
		skaluj: skala
		    "skaluje kwadrat i aktualizuje bok"
		    
		    super skaluj: skala.
		    bok := bok * skala.! !

	!Kwadrat methodsFor: 'initialize-release'!

		initialize: bok
		initialize: abok
			"tworz kwadrat o podanym boku"
			bok := abok.
			super initialize: 4.
			wierzcholki at: 2 put: bok@0.
			wierzcholki at: 3 put: bok@bok.
			wierzcholki at: 4 put: 0@bok.! !
	
	!Kwadrat methodsFor: 'printing'!

" | k1 k2 |
		drukuj
			"drukuje zmienne kwadratu"
			super drukuj.
			Transcript tab; show: 'Bok: ', bok printString; cr.! !

| k1 k2 k3 |
k1:=Kwadrat new initialize: 4.
k2:=Kwadrat new initialize: 5.
Transcript show: (k1 + k2) pole printString; cr.
Transcript show: k2 pole printString; cr.
k1 drukuj. "
k3:=(k1 + k2).
k3 drukuj.
k3 skaluj: 2.
k3 drukuj.

| t1 t2 t3 |
t1:=TrojkatRownoboczny new initialize: 4.
t2:=TrojkatRownoboczny new initialize: 5.
t3:=(t1 + t2).
t3 drukuj.
t3 skaluj: 2.
t3 drukuj.
