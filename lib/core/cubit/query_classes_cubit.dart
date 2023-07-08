import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../entities/class.dart';

part 'query_classes_state.dart';

class QueryClassesCubit extends Cubit<QueryClassesState> {
  QueryClassesCubit() : super(QueryClassesInitial());

  List<Class> searchClasses(String query) {
    List<Class> filteredClasses = (state as QueryClassesLoaded).classes.where((classObj) {
      // Perform fuzzy matching against the query
      String className = classObj.name.toLowerCase();
      query = query.toLowerCase();
      return className.contains(query);
    }).toList();
    filteredClasses = filteredClasses.take(10).toList();

    return filteredClasses;
  }

  void loadClasses() {
    List<String> classNames = [
      "ADMN 311",
      "ADMN 312",
      "ADMN 477",
      "ADMN 509",
      "ADMN 512",
      "ADMN 550",
      "ADMN 557",
      "ADMN 580",
      "ADMN 596",
      "ADMN 598",
      "ADMN 599",
      "ADMN 600",
      "ADMN 693",
      "ADMN 699",
      "AE 305",
      "AE 306",
      "AE 307",
      "AE 309",
      "AE 310",
      "AE 319",
      "AE 322",
      "AGEI 473",
      "AHVS 392",
      "AHVS 598",
      "AHVS 693",
      "AHVS 699",
      "ANTH 100",
      "ANTH 150",
      "ANTH 200",
      "ANTH 343",
      "ANTH 344",
      "ANTH 367",
      "ANTH 381",
      "ANTH 382",
      "ANTH 383",
      "ANTH 483",
      "ANTH 516",
      "ANTH 597",
      "ANTH 599",
      "ANTH 693",
      "ANTH 699",
      "ART 141",
      "ART 351",
      "ART 570",
      "ART 598",
      "ASTR 101",
      "ATWP 135",
      "ATWP 250",
      "BCMB 298",
      "BCMB 398",
      "BCMB 498",
      "BCMB 693",
      "BIOC 599",
      "BIOC 699",
      "BIOL 360",
      "BIOL 370",
      "BIOL 400",
      "BIOL 560",
      "BIOL 599",
      "BIOL 693",
      "BIOL 699",
      "BME 201",
      "BME 448",
      "BME 452",
      "BME 499",
      "BME 505",
      "BME 548",
      "BME 552",
      "BME 598",
      "BUS 670",
      "BUS 687",
      "BUS 694",
      "BUS 699",
      "CD 501",
      "CD 518",
      "CD 526",
      "CD 530",
      "CD 531",
      "CD 598",
      "CD 599",
      "CHEM 091",
      "CHEM 101",
      "CHEM 102",
      "CHEM 150",
      "CHEM 225",
      "CHEM 231",
      "CHEM 234",
      "CHEM 260",
      "CHEM 298",
      "CHEM 363",
      "CHEM 364",
      "CHEM 398",
      "CHEM 399",
      "CHEM 599",
      "CHEM 693",
      "CHEM 699",
      "CIVE 210",
      "CIVE 220",
      "CIVE 242",
      "CIVE 285",
      "CIVE 295",
      "CIVE 410",
      "CIVE 421",
      "CIVE 450",
      "CIVE 453",
      "CIVE 459",
      "CIVE 580",
      "CIVE 595",
      "CIVE 599",
      "CIVE 693",
      "CIVE 695",
      "CIVE 699",
      "COM 202",
      "COM 220",
      "COM 240",
      "COM 250",
      "COM 317",
      "COM 400",
      "COM 402",
      "COM 410",
      "COM 425",
      "COM 426",
      "COM 445",
      "COM 450",
      "COM 495",
      "CS 101",
      "CS 102",
      "CSC 110",
      "CSC 115",
      "CSC 130",
      "CSC 225",
      "CSC 226",
      "CSC 230",
      "CSC 305",
      "CSC 320",
      "CSC 360",
      "CSC 370",
      "CSC 423",
      "CSC 429",
      "CSC 503",
      "CSC 523",
      "CSC 529",
      "CSC 597",
      "CSC 598",
      "CSC 599",
      "CSC 693",
      "CSC 699",
      "CYC 211",
      "CYC 311",
      "CYC 320",
      "CYC 370",
      "CYC 411",
      "CYC 423",
      "CYC 475",
      "CYC 546",
      "CYC 553",
      "CYC 562",
      "CYC 563",
      "CYC 586",
      "CYC 598",
      "CYC 599",
      "CYC 693",
      "CYC 699",
      "DR 598",
      "DR 599",
      "ECE 216",
      "ECE 220",
      "ECE 242",
      "ECE 250",
      "ECE 260",
      "ECE 299",
      "ECE 310",
      "ECE 404",
      "ECE 410",
      "ECE 441",
      "ECE 450",
      "ECE 466",
      "ECE 481",
      "ECE 499",
      "ECE 509",
      "ECE 512",
      "ECE 537",
      "ECE 543",
      "ECE 568",
      "ECE 570",
      "ECE 572",
      "ECE 597",
      "ECE 598",
      "ECE 599",
      "ECE 609",
      "ECE 693",
      "ECE 699",
      "ECON 180",
      "ECON 203",
      "ECON 204",
      "ECON 225",
      "ECON 245",
      "ECON 246",
      "ECON 305",
      "ECON 313",
      "ECON 321",
      "ECON 345",
      "ECON 416",
      "ECON 454",
      "ECON 529",
      "ECON 598",
      "ECON 599",
      "ECON 693",
      "ECON 699",
      "ED-D 408",
      "ED-D 414",
      "ED-D 417",
      "ED-D 418",
      "ED-D 420",
      "ED-D 425",
      "ED-D 516",
      "ED-D 521",
      "ED-D 522",
      "ED-D 523",
      "ED-D 525",
      "ED-D 597",
      "ED-D 598",
      "ED-D 599",
      "ED-D 693",
      "ED-D 699",
      "EDCI 208",
      "EDCI 308",
      "EDCI 311",
      "EDCI 312",
      "EDCI 335",
      "EDCI 337",
      "EDCI 338",
      "EDCI 339",
      "EDCI 347",
      "EDCI 414",
      "EDCI 487",
      "EDCI 490",
      "EDCI 508",
      "EDCI 511",
      "EDCI 591",
      "EDCI 597",
      "EDCI 599",
      "EDCI 693",
      "EDCI 699",
      "ENGR 141",
      "ENGR 240",
      "ENGR 297",
      "ENGR 446",
      "ENSH 101",
      "ENSH 202",
      "ENSH 250",
      "ENSH 310",
      "ENSH 353",
      "ENSH 533",
      "ENSH 598",
      "ENSH 599",
      "ENSH 693",
      "ENSH 699",
      "ENT 100",
      "ENT 400",
      "ENT 402",
      "ENT 410",
      "ENT 411",
      "ENT 412",
      "ENT 413",
      "EOS 300",
      "EOS 400",
      "EOS 401",
      "EOS 599",
      "EOS 693",
      "EOS 699",
      "EPHE 142",
      "EPHE 145",
      "EPHE 155",
      "EPHE 356",
      "EPHE 359",
      "EPHE 572",
      "EPHE 575",
      "EPHE 576",
      "EPHE 577",
      "EPHE 579",
      "EPHE 591",
      "EPHE 598",
      "EPHE 599",
      "EPHE 693",
      "EPHE 699",
      "ER 329",
      "ER 390",
      "ER 400",
      "ER 412",
      "ES 200",
      "ES 240",
      "ES 380",
      "ES 429",
      "ES 470",
      "ES 471",
      "ES 473",
      "ES 481",
      "ES 482",
      "ES 593",
      "ES 599",
      "ES 693",
      "ES 699",
      "EUS 490",
      "EUS 495",
      "FORB 560",
      "FRAN 100",
      "FRAN 365",
      "FRAN 598",
      "FRAN 599",
      "GDS 391",
      "GEOG 222",
      "GEOG 315",
      "GEOG 317",
      "GEOG 380",
      "GEOG 388",
      "GEOG 391",
      "GEOG 409",
      "GEOG 453",
      "GEOG 491",
      "GEOG 599",
      "GEOG 693",
      "GEOG 699",
      "GMST 180",
      "GMST 587",
      "GMST 598",
      "GMST 599",
      "GNDR 100",
      "GNDR 219",
      "GNDR 326",
      "GRS 495",
      "GRS 599",
      "GS 502",
      "GS 503",
      "GS 504",
      "HINF 310",
      "HINF 330",
      "HINF 345",
      "HINF 351",
      "HINF 371",
      "HINF 485",
      "HINF 531",
      "HINF 537",
      "HINF 597",
      "HINF 598",
      "HINF 599",
      "HINF 693",
      "HINF 699",
      "HLTH 351",
      "HLTH 360",
      "HSD 580",
      "HSTR 308",
      "HSTR 371",
      "HSTR 382",
      "HSTR 440",
      "HSTR 519",
      "HSTR 550",
      "HSTR 597",
      "HSTR 598",
      "HSTR 599",
      "HSTR 693",
      "HSTR 695",
      "HSTR 699",
      "IB 415",
      "IB 416",
      "IB 417",
      "IED 158",
      "IED 159",
      "IED 199",
      "IED 251",
      "IED 256",
      "IED 259",
      "IED 287",
      "IED 358",
      "IED 359",
      "IED 371",
      "IED 372",
      "IED 373",
      "IED 374",
      "IED 387",
      "IED 399",
      "IED 473",
      "IED 476",
      "IED 510",
      "IED 594",
      "IED 597",
      "IED 598",
      "IED 599",
      "IED 693",
      "IED 699",
      "IGOV 598",
      "IGOV 599",
      "IGOV 693",
      "IGOV 699",
      "IN 697",
      "INGH 453",
      "INGH 520",
      "INGH 522",
      "INTD 599",
      "INTD 693",
      "INTD 699",
      "INTS 460",
      "IS 201",
      "ISP 400",
      "LAW 301",
      "LAW 309",
      "LAW 315",
      "LAW 343",
      "LAW 349",
      "LAW 350",
      "LAW 353",
      "LAW 360",
      "LAW 388",
      "LAW 390",
      "LAW 399",
      "LAW 598",
      "LAW 599",
      "LAW 693",
      "LAW 699",
      "LING 156",
      "LING 181",
      "LING 182",
      "LING 187",
      "LING 598",
      "LING 599",
      "LING 693",
      "LING 699",
      "MATH 101",
      "MATH 109",
      "MATH 122",
      "MATH 151",
      "MATH 200",
      "MATH 204",
      "MATH 211",
      "MATH 301",
      "MATH 346",
      "MATH 599",
      "MATH 693",
      "MATH 699",
      "MBA 502",
      "MBA 510",
      "MBA 523",
      "MBA 555",
      "MBA 564",
      "MBA 570",
      "MBA 577",
      "MBA 595",
      "MBA 596",
      "MECH 220",
      "MECH 240",
      "MECH 242",
      "MECH 285",
      "MECH 295",
      "MECH 400",
      "MECH 420",
      "MECH 430",
      "MECH 446",
      "MECH 448",
      "MECH 452",
      "MECH 455",
      "MECH 460",
      "MECH 462",
      "MECH 493",
      "MECH 498",
      "MECH 499",
      "MECH 521",
      "MECH 546",
      "MECH 563",
      "MECH 580",
      "MECH 594",
      "MECH 595",
      "MECH 598",
      "MECH 599",
      "MECH 693",
      "MECH 695",
      "MECH 699",
      "MEDI 330",
      "MGB 182",
      "MGB 520",
      "MGB 535",
      "MGB 536",
      "MGB 540",
      "MICR 599",
      "MICR 699",
      "MM 505",
      "MM 596",
      "MRNE 401",
      "MRNE 410",
      "MRNE 414",
      "MRNE 420",
      "MRNE 430",
      "MRNE 435",
      "MUS 111",
      "MUS 116",
      "MUS 588",
      "MUS 596",
      "MUS 599",
      "MUS 689",
      "MUS 690",
      "MUS 693",
      "MUS 699",
      "NRSC 599",
      "NRSC 693",
      "NRSC 699",
      "NUHI 598",
      "NUHI 599",
      "NUNP 537",
      "NUNP 540",
      "NUNP 593",
      "NURS 370",
      "NURS 470",
      "NURS 491",
      "NURS 522",
      "NURS 525",
      "NURS 596",
      "NURS 599",
      "NURS 693",
      "NURS 699",
      "PAAS 138",
      "PAAS 458",
      "PAAS 599",
      "PAAS 699",
      "PADR 505",
      "PHIL 201",
      "PHIL 232",
      "PHIL 592",
      "PHIL 598",
      "PHIL 693",
      "PHIL 699",
      "PHSP 504",
      "PHSP 550",
      "PHSP 552",
      "PHSP 591",
      "PHSP 599",
      "PHYS 111",
      "PHYS 323",
      "PHYS 326",
      "PHYS 545",
      "PHYS 546",
      "PHYS 599",
      "PHYS 662",
      "PHYS 693",
      "PHYS 699",
      "POLI 202",
      "POLI 311",
      "POLI 349",
      "POLI 350",
      "POLI 351",
      "POLI 366",
      "POLI 369",
      "POLI 391",
      "POLI 433",
      "POLI 456",
      "POLI 598",
      "POLI 599",
      "POLI 693",
      "POLI 699",
      "PSYC 201",
      "PSYC 210",
      "PSYC 231",
      "PSYC 243",
      "PSYC 251",
      "PSYC 260",
      "PSYC 330",
      "PSYC 334",
      "PSYC 336",
      "PSYC 365",
      "PSYC 375",
      "PSYC 491",
      "PSYC 501",
      "PSYC 503",
      "PSYC 505",
      "PSYC 537",
      "PSYC 572",
      "PSYC 583",
      "PSYC 599",
      "PSYC 603",
      "PSYC 606",
      "PSYC 693",
      "PSYC 699",
      "SDH 599",
      "SDH 693",
      "SDH 699",
      "SENG 265",
      "SENG 275",
      "SENG 310",
      "SENG 426",
      "SENG 440",
      "SENG 474",
      "SENG 475",
      "SENG 499",
      "SLST 410",
      "SLST 599",
      "SLST 699",
      "SMGT 415",
      "SMGT 416",
      "SMGT 417",
      "SOCI 103",
      "SOCI 204",
      "SOCI 206",
      "SOCI 220",
      "SOCI 313",
      "SOCI 345",
      "SOCI 390",
      "SOCI 436",
      "SOCI 598",
      "SOCI 599",
      "SOCI 693",
      "SOCI 699",
      "SOCW 304",
      "SOCW 400",
      "SOCW 402",
      "SOCW 404",
      "SOCW 413",
      "SOCW 451",
      "SOCW 475",
      "SOCW 476",
      "SOCW 506",
      "SOCW 517",
      "SOCW 540",
      "SOCW 571",
      "SOCW 599",
      "SOCW 693",
      "SPAN 185",
      "SPAN 205",
      "SPAN 699",
      "STAT 123",
      "STAT 255",
      "STAT 260",
      "STAT 261",
      "STAT 350",
      "STAT 598",
      "STAT 599",
      "STAT 693",
      "STAT 699",
      "THEA 524",
      "THEA 598",
      "THEA 693",
      "THEA 699",
      "WRIT 598",
      "WRIT 693",
      "WRIT 699"
    ];
    List<Class> classList = classNames.map((className) {
      List<String> parts = className.split(" ");
      String name = parts[0];
      int code = int.parse(parts[1]);
      return Class(name: name, code: code);
    }).toList();
    emit(QueryClassesLoaded(classList));
  }
}
