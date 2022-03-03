; Menanyakan frekuensi makan
(defrule frekmakan
	=>
	(printout t crlf "Kami akan mengajukan pertanyaan untuk mendeteksi gangguan makan," crlf "Ketik opsi hurufnya saja" crlf)
	(printout t crlf "Bagaimana frekuensi makan Anda?" crlf "A : Jarang" crlf "B : Sering" crlf)
	(bind ?ans (read))
	(if (eq ?ans A)
		then (assert (frekmakan jarang))
	)(if (eq ?ans B)
		then (assert (frekmakan sering))
	)
)

; Menanyakan gejala untuk penderita yang jarang makan
(defrule refuseHungry(frekmakan jarang)
	=>
	(printout t crlf "Apakah Anda menyangkal rasa lapar dan mencari alasan untuk tidak makan?" crlf "A : Ya" crlf "B : Tidak" crlf)
	(bind ?ans (read))
	(if (eq ?ans A)
		then (assert (refuseHungry ya))
	)(if (eq ?ans B)
		then (assert (refuseHungry tidak))
	)
)

; Menanyakan gejala untuk yang jarang makan, dan yang menolak makan
(defrule ORlebih(refuseHungry ya)
	=>
	(printout t crlf "Apakah Anda melakukan olahraga berlebih untuk menurunkan berat badan?" crlf "A : Ya" crlf "B : Tidak" crlf)
	(bind ?ans (read))
	(if (eq ?ans A)
		then (assert (ORlebih ya))
	)(if (eq ?ans B)
		then (assert (ORlebih tidak))
	)
)

; menanyakan gejala mengenai berat badan pada orang yang bergejala jarang makan, menolak makan, dan olahraga berlebih
(defrule BBYA(ORlebih ya)
	=>
	(printout t crlf "Apakah berat badan Anda turun drastis?" crlf "A : Ya" crlf "B : Tidak" crlf)
	(bind ?ans (read))
	(if (eq ?ans A)
		then (printout t crlf "Anda mengalami gangguan makan Anoreksia." crlf)
	)(if (eq ?ans B)
		then (printout t crlf "Sebagian besar keluhan Anda menunjukkan gejala gangguan makan Anoreksia." crlf)
	)
)

; menanyakan gejala mengenai berat badan pada orang yang bergejala jarang makan, menolak makan, dan tidak berolahraga berlebih
(defrule BBNO(ORlebih tidak)
	=>
	(printout t crlf "Apakah berat badan Anda turun drastis?" crlf "A : Ya" crlf "B : Tidak" crlf)
	(bind ?ans (read))
	(if (eq ?ans A)
		then (printout t crlf "Anda mengalami gangguan makan Anoreksia." crlf)
	)(if (eq ?ans B)
		then (printout t crlf "Sebagian besar keluhan Anda menunjukkan gejala gangguan makan Anoreksia." crlf)
	)
)

; Menanyakan porsi makan pada orang yang sering makan 
(defrule porsiBesar(frekmakan sering)
	=>
	(printout t crlf "Apakah porsi makan Anda sulit terknontrol dan banyak?" crlf "A : Ya" crlf "B : Tidak" crlf)
	(bind ?ans (read))
	(if (eq ?ans A)
		then (assert (porsiBesar ya))
	)(if (eq ?ans B)
		then (assert (porsiBesar tidak))
	)
)

; menanyakan hal yang dilakukan setelah makan, ketika sering makan dan porsi besar
(defrule stlhmkn(porsiBesar ya)
	=>
	(printout t crlf "Apa yang Anda rasakan setelah makan?" crlf "A : Depresi/Menyesal" crlf "B : Memuntahkan Makanan" crlf "C : Biasa Saja" crlf)
	(bind ?ans (read))
	(if (eq ?ans A)
		then (assert (stlhmkn depresi))
	)(if (eq ?ans B)
		then (assert (stlhmkn muntah))
	)(if (eq ?ans C)
		then (assert (stlhmkn baja))
	)
)

; menanyakan apakah orang bersembunyi ketika makan pada orang yang sering makan dan porsi besar.
(defrule sembunyi(stlhmkn depresi)
	=>
	(printout t crlf "Apakah Anda bersembunyi saat makan besar?" crlf "A : Ya" crlf "B : Tidak" crlf)
	(bind ?ans (read))
	(if (eq ?ans A)
		then (printout t crlf "Anda mengalami gangguan makan Bulimia." crlf)
	)(if (eq ?ans B)
		then (printout t crlf "Sebagian besar keluhan Anda menunjukkan gejala gangguan makan Bulimia." crlf)
	)
)
; menanyakan apakah orang muntah setelah makan pada orang yang sering makan dan porsi besar.
(defrule muntah(stlhmkn muntah)
	=>
	(printout t crlf "Apakah Anda melakukan olahraga berlebih?" crlf "A : Ya" crlf "B : Tidak" crlf)
	(bind ?ans (read))
	(if (eq ?ans A)
		then (printout t crlf "Anda mengalami gangguan makan Binge Eating Disorder." crlf)
	)(if (eq ?ans B)
		then (printout t crlf "Sebagian besar keluhan Anda menunjukkan gejala gangguan makan Binge Eating Disorder." crlf)
	)
)

; Menanyakan pertanyaan tambahan untuk jawaban tidak
(defrule mental1(refuseHungry tidak)
	=>
	(printout t crlf "Apakah Anda merasa mengalami konflik/permasalahan mental/psikologis?" crlf "A : Ya" crlf "B : Tidak" crlf)
	(bind ?ans (read))
	(if (eq ?ans A)
		then (printout t crlf "Terindikasi Anda memiliki gangguan mental" crlf)
	)(if (eq ?ans B)
		then (printout t crlf "Perbaikilah pola makan Anda agar tubuh lebih sehat." crlf)
	)
)

(defrule mental2(stlhmkn baja)
	=>
	(printout t crlf "Apakah Anda merasa mengalami konflik/permasalahan mental/psikologis?" crlf "A : Ya" crlf "B : Tidak" crlf)
	(bind ?ans (read))
	(if (eq ?ans A)
		then (printout t crlf "Terindikasi Anda memiliki gangguan mental" crlf)
	)(if (eq ?ans B)
		then (printout t crlf "Perbaikilah pola makan Anda agar tubuh lebih sehat." crlf)
	)
)

(defrule mental3(porsiBesar tidak)
	=>
	(printout t crlf "Apakah Anda merasa mengalami konflik/permasalahan mental/psikologis?" crlf "A : Ya" crlf "B : Tidak" crlf)
	(bind ?ans (read))
	(if (eq ?ans A)
		then (printout t crlf "Terindikasi Anda memiliki gangguan mental" crlf)
	)(if (eq ?ans B)
		then (printout t crlf "Perbaikilah pola makan Anda agar tubuh lebih sehat." crlf)
	)
)