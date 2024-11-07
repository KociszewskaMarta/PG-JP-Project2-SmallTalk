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

	!Wielokat methodsFor: 'geometry'!
	    
	    srodekGeometryczny
	        "licz geometryczny srodek wielokata"
	        
	        | sumaX sumaY liczbaWierzcholkow |
	        sumaX := 0.
	        sumaY := 0.
	        liczbaWierzcholkow := wierzcholki size.
	        
	        wierzcholki do: [:wierzcholek | sumaX := sumaX + wierzcholek x. sumaY := sumaY + wierzcholek y.].
	       
	       ^ (sumaX / liczbaWierzcholkow) @ (sumaY / liczbaWierzcholkow).! !

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
			" ^(wierzcholki at: 2) x squared * 3 asFloatE sqrt / 4! ! "

	!TrojkatRownoboczny methodsFor: 'printing'!

		drukuj
			"drukuje zmienne trojkata"
			super drukuj.
			Transcript tab; show: 'Wysokosc: ', self wysokosc printString; cr.
			Transcript tab; show: 'Bok: ', bok printString; cr.! !

Wielokat subclass: #Kwadrat
	instanceVariableNames: ''
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

	!Kwadrat methodsFor: 'initialize-release'!

		initialize: bok
			"tworz kwadrat o podanym boku"

			super initialize: 4.
			wierzcholki at: 2 put: bok@0.
			wierzcholki at: 3 put: bok@bok.
			wierzcholki at: 4 put: 0@bok.! !

" | k1 k2 |
k1:=Kwadrat new initialize: 4.
k2:=Kwadrat new initialize: 5.
Transcript show: (k1 + k2) pole printString; cr.
Transcript show: k2 pole printString; cr.
k1 drukuj. "
| t1 t2 t3 |
t1:=TrojkatRownoboczny new initialize: 4.
t2:=TrojkatRownoboczny new initialize: 5.
t3:=(t1 + t2).
t3 drukuj.
