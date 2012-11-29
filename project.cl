;;;MEBI 531 Project
;;;Fall 2012
;;;Anthony Shaver

;;setup the data
;PGP data from http://www.hanstenandhorn.com/hh-article12-08.pdf

;from http://www.pharmacologyweekly.com/content/pages/cytochrome-cyp-p450-enzyme-medication-herbs-substrates
(defvar *substrates*
    `((CYP1A2 (
        Acetaminophen Amitriptyline Asenapine Bendamustine Caffeine Chlordiazepoxide Chlorpromazine Clopidogrel Clozapine Cyclobenzaprine Febuxostat Flutamide Imipramine Leflunomide Mexiletine Nabumetone Naproxen Nortiptyline Olanzapine Propafenone Propranolol Ranitidine Roflumilast Riluzole Tacrine Theophylline Tizanidine Zileuton Zolpidem
        ))
  (CYP2B6 (
   Bupropion Cyclophosphamide Clopidogrel Efavirenz Ifosfamide Ketamine Methadone Sertraline
   ))
  (CYP2C8 (
   Amiodarone Amodiaquine Benzphetamine Carbamazepine Cerivastatin Docetaxel Everolimus Febuxostat Fluvastatin Isotretinoin Phenytoin Pioglitazone Retinol Repaglinide Rosiglitazone Tolbutamide Torsemide Verapamil Zopiclone
   ))
  (CYP2C9 (
   Amitriptyline Carvedilol Celecoxib Chlorpheniramine Chloramphenicol Clomipramine Clopidogrel Desogstrel Diclofenac Dronabinol Febuxostat Fluoxetine Flurbiprofen Fluvastatin Formoterol Glibenclamide Glimepiride Glipizide Hexobarbital Ibuprofen Imipramine Indomethacin Irbesartan Irinotecan Ketamine Lomoxicam Losartan Mefenamic Meloxicam Mephenytoin Montelukast Nateglinide Omeprazole Phenylbutazone Piroxicam Quetiapine Rosiglitazone Sertraline Sildenafil Sulfamethoxazole Sulfinpyrazone Suprofen Tamoxifen Tienilic Tolbutamide Torsemide THC Testosterone Valdecoxib Vardenafil Valsartan Voriconazole Warfarin Zafirlukast Zileuton
   ))
  (CYP2C19 (
   Amitriptyline Carisoprodol Cilostazol Citalopram Clomipramine Clopidogrel Cyclophosphamide Desipramine Diazepam Escitalopram Esomeprazole Formoterol Hexobarbital Imipramine Indomethacin Lacosamide Lansoprazole Loratidine Mephenytoin Mephobarbital Moclobemide Nelfinavir Milutamide Notripytline Omeprazole Pantoprazole Pentamidine Phenobarbital Phenytoin Progresterone Proguanil Propranolol Rabeprazole Ranitidine Sertraline Teniposide Thioridazine Tolbutamide Voriconazole Warfarin
   ))
  (CYP2D6 (
      Alprenolol Amitriptyline Amphetamine Aripirazole Asenpine Atomoxetine Bifuralol Bisoprolol Captopril Carvedilol Cevimeline Chlorpheniramine Chlorporamzine Chlorpropamide Cinacalcet Clemastine Clomipramine Clozapine Codeine Cyclobenzaprine Darifenacin Debroquine Desipramine Dexfenfluramine Dextromethorphan Diphenhydramine Dolasetron Donepezil Doxepin Duloxetine Encainide Fenfluramine Fluphenazine Fentanyl Flecainide Fluoxetine Fluvoxamine Formoterol Galantamine Guanoxan Haloperidol Hydrocodone Hydroxyzine Iloperidone Imipramine Indoramin Lidocaine Maprotiline Meperidine Methadone Methamphetamine Methoxyamphetamine Metoclopramide Metoprolol Mexiletine Minaprine Mirtazapine Morphine Nebivolol Nortriptyline Olanzapine Ondansetron Oxycodone Paroxetine Perhexiline Perphenazine Propafenone Propoxyphene Propranolol Quetiapine Quinidine Ranolazine Risperidone Ritonavir Sertraline Sparteine Tamoxifen Thioridazine Timolol Tolterodine Tramadol Trazadone Tripelennamine Tropisetron Venlafaxine
   ))
  (CYP2E1 (Acetaminophen Disulfiram Theophylline
   ))
  (CYP3A4 (Abiraterone Alfentanil Alfuzosin Aliskiren Almotriptan Alprazolam Amitriptyline Amiodarone Amlodipine Amprenavir Aprepitant Aripiprazole Astemizole Atazanavir Atorvastatin Bepridil Bexarotene Boceprevir Bromocriptine Budesonide Buprenorphine Buspirone Cafergot Caffeine Cannabinoids Carbamazepine Cerivastatin Cevimeline Chlordiazepoxide Cinacalcet Citalopram Clarithromycin Clindamycin Clomipramine Clonazepam Clopidogrel Clorazepate Clozapine Cocaine Codeine Colchicine Cyclophosphamide Cyclosporine Dapsone Darifenacin Darunavir Delavirdine Desogestrel Dextromethorphan Diazepam Dihdroergotamine Disopyramide Diltiazem Docetaxel Dofetilide Dolasetron Domperidone Donepezil Doxorubicin Dronabinol Dutasteride Efavirenz Eplerenone Ergotamine Erlotinib Erythromycin Esomeprazole Eszoplicone Ethinylestradiol Ethosuximide Etonogestrel Etoposide Everolimus Exemestane Felodipine Fentanyl Finasteride Fexofenadine Flurazepam Flutamide Fluticasone Galantamine Haloperidol Hydrocodone Iloperidone Imatinib Imipramine Indinavir Irinotecan Isradipine Itraconazole Ketamine Ketoconazole Lansoprazole Letrozole Lercanidipine Lidocaine Loratadine Lopinavir Lovastatin Methadone Midazolam Mifepristone Mirtazapine Modafinil Mometasone Montelukast Nateglinide Nelfinavir Nevirapine Nicardipine Nifedipine Nisoldipine Nitrendipine Norethindrone Ondansetron Omeprazole Oxybutynin Oxycodone Paclitaxel Pantoprazole Pioglitazone Propafenone Propranolol Quetiapine Quinidine Quinine Rabeprazole Ramelteon Ranitidine Ranolazine Repaglinide Rifampin Ritonavir Rivaroxaban Rofulmilast Salmeterol Saquinavir Saxagliptin Sertraline Sibutramine Sildenafil Simvastatin Sirolimus Solifenacin Sorafenib Sufentanil Sunitinib Steroids Tacrolimus Tadalafil Tamoxifen Telaprevir Telithromycin Temazepam Temsirolimus THC Theophylline Tiagabine Tinidazole Tipranavir Tolterodine Toremifene Tramadol Trazadone Triazolam Trimetrexate Valdecoxib Valproic Vardenafil Verapamil Vinblastine Vincristine Voriconazole Warfarin Zaleplon Zileuton Ziprasidone Zolpidem Zonisamide
   ))
   (PGP (Colchicine Cyclosporine Digoxin Fexofenadine Indinavir Morphine Sirolimus))
 ))

;from http://www.pharmacologyweekly.com/content/pages/medications-herbs-cytochrome-p450-cyp-enzyme-inhibitors
(defvar *inhibitors*
 `(
  (CYP1A2 (Amiodarone Atazanavir Cimetidine Ciprofloxacin Citalopram Clarithromycin Diltiazem Enoxacin Erythromycin Estradiol Fluvoxamine Interferon Isoniazid Ketoconazole Methoxsalen Mibefradil Tegaserod
    ))
  (CYP2B6 (Thiopeta Ticlodipine
    ))
  (CYP2C8 (Anastrozole Ezetimibe Gemfibrozil Montelukast Nicardipine Sulfinpyrazone Trimethoprim
    ))
  (CYP2C9 (Amiodarone Atazanavir Cimetidine Clopidogrel Cotrimoxazole Delavirdine Disulfiram Efavirenz Fenofibrate Fluconazole Fluorouracil Fluoxetine Fluvastatin Fluvoxamine Gemfibrozil Imatinib Isoniazid Itraconazole Ketoconazole Leflunomide Lovastatin Methoxsalen Metronidazole Mexiletine Modafinil Nalidixic Norethindrone Norfloxacin Omeprazole Contraceptives Paroxetine Phenylbutazone Probenecid Sertraline Sulfamethoxazole Sulfaphenazole Sulfonamides Tacrine Teniposide Ticlodipine Tipranavir Troleandomycin Voriconazole Zafirlukast Zileutin
    ))
  (CYP2C19 (Cimetidine Citalopram Delavirdine Efavirenz Felbamate Fluconazole Fluoxetine Fluvastatin Fluvoxamine Indomethacin Isoniazid Ketoconazole Lansoprazole Modafinil Omperazole Oxcarbazepine Probenecid Ticlodipine Topiramate
    ))
  (CYP2D6 (Abiraterone Amiodarone Asenapine Buproprion Celecoxib Chloroquine Chlorpheniramine Chlorpromazine Cimetidine Cinacalcet Citalopram Clemastine Clomipramine Cocaine Darifenacin Desipramine Diphenhydramine Doxepin Doxorubicin Duloxetine Escitalopram Febuxostat Fluoxetine Fluphenazine Halofantrine Haloperidol Hydroxychloroquine Hydroxyzine Imatinib Levomepromazine Methadone Metoclopramide Mibefradil Midodrine Moclobemide Nefazodone Norfluoxetine Paroxetine Perphenazine Propafenone Propoxyphene Propranolol Quinacrine Quinidine Ranitidine Ranolazine Ritonavir Sertraline Tegaserod Terbinafine Thioridazine Ticlodipine Tipranavir Tripelennamine
    ))
  (CYP2E1 (Disulfiram
    ))
  (CYP3A4 (Amiodarone Amprenavir Aprepitant Atazanavir Boceprevir Cimetidine Ciprofloxacin Clarithromycin Cyclosporine Danazol Delavirdine Diltiazem Efavirenz Erythromycin Estradiol Ezetimibe Fluconazole Fluoxetine Fluvoxamine Gestodene Imatinib Indinavir Isoniazid Itraconazole Ketoconazole Methylprednisolone Mibefradil Miconazole Mifepristone Nefazodone Nelfinavir Nicardipine Nifedipine Norethindrone Norfloxacin Norfluoxetine Oxiconazole Posaconazole Prednisone Quinine Ranolazine Ritonavir Roxithromycin Saquinavir Sertraline Telaprevir Telithromycin Troleandomycin Verapamil Voriconazole Zafirlukast Zileutin
    ))
    (PGP (Amiodarone Clarithromycin Erythromycin Ketoconazole Quinidine Saquinavir Verapamil))
 ))

;from http://www.pharmacologyweekly.com/content/pages/medications-herbs-cytochrome-p450-cyp-inducers
(defvar *inducers*
  `(
  (CYP1A2 (Carbamazepine Clotrimazole Phenobarbital Phenytoin Primidone Psoralen
    ))
  (CYP2B6 (Barbituates Mephenytoin Phenobarbital Phenytoin Primidone Roflumilast
    ))
  (CYP2C8 (Carbamazepine Phenytoin Rifabutin Rifampin
    ))
  (CYP2C9 (Aprepitant Barbiturates Carbamazepine Primidone Rifampin Vigabatrin
    ))
  (CYP2C19 (Barbiturates Norethindrone Phenytoin Rifampin
    ))
  (CYP2D6 (Carbamazepine Ethanol Phenobarbital Phenytoin Primidone Rifampin
    ))
  (CYP2E1 (Ethanol Isoniazid
    ))
  (CYP3A4 (Amprenavir Barbituates Carbamazepine Clotrimazole Dexamethasone Efavirenz Ethosuximide Griseofulvin Modafinil Nevirapine Oxcarbazepine Phenobarbital Phenytoin Prednisone Primidone Rifabutin Rifampin Rifapentine Ritonavir Topiramate
    ))
    (PGP (Carbamazepine Rifampin Tipranavir
        ))
  ))

;;load the inference code
;copied from http://faculty.washington.edu/ikalet/courses/lisp/code/inference.cl
(load "inference.cl")

;;build the knowledge
;substrates, in the form (<- (substrate-of drug enzyme))
(dolist (x *substrates*)
    (let ((enz (first x)) (drugs (second x)))
        (dolist (drug drugs)
            (eval `(<- (substrate-of ,drug ,enz)))
            )
        )
    )

;inhibitors, in the form (<- (inhibits drug enzyme))
(dolist (x *inhibitors*)
    (let ((enz (first x)) (drugs (second x)))
        (dolist (drug drugs)
            (eval `(<- (inhibits ,drug ,enz)))
            )
        )
    )
    
;inducers, in the form (<- (induces drug enzyme))
(dolist (x *inducers*)
    (let ((enz (first x)) (drugs (second x)))
        (dolist (drug drugs)
            (eval `(<- (induces ,drug ,enz)))
            )
        )
    )

;;define the rules
;drug A inhibits the CYP450 that drug B is a substrate of, or vice versa
(<- (interacts ?a ?b)
    (or
        (and (inhibits ?a ?c)
            (substrate-of ?b ?c))
        (and (inhibits ?b ?c)
            (substrate-of ?a ?c)
            )
        )
    )

;drug A induces the CYP450 that drug B is a substrate of, or vice versa
(<- (interacts ?a ?b)
    (or
        (and (induces ?a ?c)
            (substrate-of ?b ?c))
        (and (induces ?b ?c)
            (substrate-of ?a ?c)
            )
        )
    )


;;helper functions
(defun test-interaction (drug-a drug-b)
    "wrapper around prove that tests interactions and formats them nicely"
    (let ((intx (prove `(interacts ,drug-a ,drug-b))))
        (cond 
            ((eql nil intx)
                (format t "~A and ~A do not appear to interact via CYP450s or PGP~%" drug-a drug-b))
            (t
                (format t "~A and ~A interact via: ~{~A~^, ~} ~%" drug-a drug-b (extract-cyps intx)))
            )
        )
    )

(defun extract-cyps (intx)
    "helper function to extract which CYP450s are returned by a call like (prove '(interacts drug-a drug-b))"
    (remove-duplicates (mapcar #'cdr (mapcar #'car intx)) :test #'equal)
    )

; TODO figure out how to wrap the function below and make generic for any drug
; (with-answer (interacts warfarin ?x)
;     (format t "warfarin interacts with ~A.~%" ?x)
;     )

;; sample queries
; what drugs interact with themselves?
;(with-answer (interacts ?x ?x) (format t "~A interacts with itself~%" ?x))

