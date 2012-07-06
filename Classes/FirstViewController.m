//
//  FirstViewController.m
//  CentenarioLite
//
//  Created by Gabriel Pacheco on 09/11/09.
//  Copyright __MyCompanyName__ 2009. All rights reserved.
//

#import "FirstViewController.h"


@implementation FirstViewController
@synthesize timerFake ,flipDelegate ;


// Implement loadView to create a view hierarchy programmatically, without using a nib.
//- (void)loadView {
//	
//}

	// Tells the root view, via a delegate, to flip over to the FlipSideView
- (IBAction)infoButtonPressed:(id)sender {
	[self.flipDelegate toggleView:self];
}

// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad {
    [super viewDidLoad];
	myFireBoolean = 0 ;
	NSLog(@"viewDidLoad do relogio");
	timerFake = [NSTimer scheduledTimerWithTimeInterval:1 target:self selector:@selector(calculoDosDias) userInfo:nil repeats:YES];
}

-(void)calculoDosDias {
//	NSLog(@"%i",myFireBoolean);

	if (myFireBoolean == 0) {

	NSCalendar *gregorian = [[NSCalendar alloc]initWithCalendarIdentifier:NSGregorianCalendar];
	NSDate* now = [NSDate date];
	
		//inicializo o dicionario principal
	NSString*path = [[NSBundle mainBundle] pathForResource:@"MainForDate" ofType:@"plist"];
	
	NSMutableArray* outroArray = [[NSMutableArray alloc] initWithContentsOfFile:path];
//	[path release];
	NSDate* DataCentenario ;
	
	for (NSDictionary*mainDict in outroArray) 
	{
		DataCentenario  = [mainDict objectForKey:@"diaCentenario"];
	}
		//pego os dias que restam 
	NSTimeInterval intervaloMega = [DataCentenario timeIntervalSinceDate:now];
	double diasDouble = intervaloMega / 86400 ;
	int diasInt = diasDouble ;
	
		//calculo hora , minuto e segundo 
	NSDateComponents* anoDate = [gregorian components:NSYearCalendarUnit fromDate:now];
	int anoDatee = [anoDate year];
//	[anoDate release];
	NSDateComponents* mesDate = [gregorian components:NSMonthCalendarUnit fromDate:now];
	int mesDatee = [mesDate month];
//	[mesDate release];
	NSDateComponents* diaDate = [gregorian components:NSDayCalendarUnit fromDate:now];
	int diaDatee = [diaDate day];
//	[diaDate release];
	NSDateComponents* horaDate = [gregorian components:NSHourCalendarUnit fromDate:now];
	int horaAtual = [horaDate hour];
//	[horaDate release];
	int horaToCentenario  = 0 ;
	if (horaAtual == 23) {
		
	}
	else {
		horaToCentenario = 23 - horaAtual ;
	}

	NSLog(@"%i",horaToCentenario);
	NSDateComponents* minDate = [gregorian components:NSMinuteCalendarUnit fromDate:now];
	int minAtual = [minDate minute];
//	[minDate release];
	int minToCentenario = 59 - minAtual ;
	NSLog(@"%i",minToCentenario);
	NSDateComponents* secDate = [gregorian components:NSSecondCalendarUnit fromDate:now];
	int secAtual = [secDate second];
//	[secDate release];
	int secToCentenario = 60 - secAtual ;
	
	NSDateComponents* horaCent = [gregorian components:NSHourCalendarUnit fromDate:DataCentenario];
	int horaCente = [horaCent hour];
//	[horaCent release];
	NSDateComponents* minCent = [gregorian components:NSMinuteCalendarUnit fromDate:DataCentenario];
	int minCente = [minCent minute];
//	[minCent release];
	NSDateComponents* segCent = [gregorian components:NSSecondCalendarUnit fromDate:DataCentenario];
	int segCente = [segCent second];
//	[segCent release];
	NSDateComponents* anoCent = [gregorian components:NSYearCalendarUnit fromDate:DataCentenario];
	int anoCente = [anoCent year];
//	[anoCent release];
	NSDateComponents* mesCent = [gregorian components:NSMonthCalendarUnit fromDate:DataCentenario];
	int mesCente = [mesCent month];
//	[mesCent release];
	NSDateComponents* diaCent = [gregorian components:NSDayCalendarUnit fromDate:DataCentenario];
	int diaCente = [diaCent day];
//	[diaCent release];
	[gregorian release];
	NSDictionary* mainDict = [outroArray objectAtIndex:0];
	
	NSComparisonResult result = [DataCentenario compare:now ];
	
	if (result = NSOrderedSame) {
		NSString* zeroD = [mainDict objectForKey:@"0d"];
		NSString* zeroT = [mainDict objectForKey:@"0t"];
		centenaDia.image = [UIImage imageNamed:zeroD];
		dezenaDia.image = [UIImage imageNamed:zeroD];
		unidadeDia.image = [UIImage imageNamed:zeroD];
		dezenaHora.image = [UIImage imageNamed:zeroT];
		unidadeHora.image = [UIImage imageNamed:zeroT];
		dezenaMin.image = [UIImage imageNamed:zeroT];
		unidadeMin.image = [UIImage imageNamed:zeroT];
		dezenaSeg.image = [UIImage imageNamed:zeroT];
		unidadeSeg.image = [UIImage imageNamed:zeroT];
	}
	//[now release];
//	[DataCentenario release];


	if (anoDatee >= anoCente) {
		if (mesDatee >= mesCente) {
			if (diaDatee >= diaCente) {
				if (horaAtual >= horaCente) {
					if (minAtual >= minCente) {
						if (secAtual >= segCente) {
							NSString* zeroD = [mainDict objectForKey:@"0d"];
							NSString* zeroT = [mainDict objectForKey:@"0t"];
							centenaDia.image = [UIImage imageNamed:zeroD];
							dezenaDia.image = [UIImage imageNamed:zeroD];
							unidadeDia.image = [UIImage imageNamed:zeroD];
							dezenaHora.image = [UIImage imageNamed:zeroT];
							unidadeHora.image = [UIImage imageNamed:zeroT];
							dezenaMin.image = [UIImage imageNamed:zeroT];
							unidadeMin.image = [UIImage imageNamed:zeroT];
							dezenaSeg.image = [UIImage imageNamed:zeroT];
							unidadeSeg.image = [UIImage imageNamed:zeroT];
						}
						else {
							
							NSLog(@"%i",secToCentenario);
								//DIAS
								//centenas
							if (diasInt <= 99) {
								NSString* zeroD = [mainDict objectForKey:@"0d"];
								centenaDia.image = [UIImage imageNamed:zeroD]; 
							}
							else {
								if (diasInt <= 199) {
									NSString* umD = [mainDict objectForKey:@"1d"];
									centenaDia.image = [UIImage imageNamed:umD];
								}
								else {
									if (diasInt <= 299) {
										NSString* doisD = [mainDict objectForKey:@"2d"];
										centenaDia.image = [UIImage imageNamed:doisD];
									}
									else {
										if (diasInt <= 399) {
											NSString* tresD = [mainDict objectForKey:@"3d"];
											centenaDia.image = [UIImage imageNamed:tresD];
										}
									}
									
								}
								
							}
								//dezenas
							int toDezenas = diasInt ;
							for (toDezenas; toDezenas >= 100;) {
								NSLog(@"%i",toDezenas);
								toDezenas = toDezenas - 100 ;
							}
							if (toDezenas <= 9 ) {
								NSString* zeroD = [mainDict objectForKey:@"0d"];
								dezenaDia.image = [UIImage imageNamed:zeroD];
							}
							else {
								if (toDezenas <= 19) {
									NSString* umD = [mainDict objectForKey:@"1d"];
									dezenaDia.image = [UIImage imageNamed:umD];
								}
								else {
									if (toDezenas <= 29) {
										NSString* doisD = [mainDict objectForKey:@"2d"];
										dezenaDia.image = [UIImage imageNamed:doisD];
									}
									else {
										if (toDezenas <= 39) {
											NSString* tresD = [mainDict objectForKey:@"3d"];
											dezenaDia.image = [UIImage imageNamed:tresD];
										}
										else {
											if (toDezenas <= 49) {
												NSString* quatroD = [mainDict objectForKey:@"4d"];
												dezenaDia.image = [UIImage imageNamed:quatroD];
											}
											else {
												if (toDezenas <= 59) {
													NSString* cincoD = [mainDict objectForKey:@"5d"];
													dezenaDia.image = [UIImage imageNamed:cincoD];
												}
												else {
													if (toDezenas <= 69) {
														NSString* seisD = [mainDict objectForKey:@"6d"];
														dezenaDia.image = [UIImage imageNamed:seisD];
													}
													else {
														if (toDezenas <= 79) {
															NSString* seteD = [mainDict objectForKey:@"7d"];
															dezenaDia.image = [UIImage imageNamed:seteD];
														}
														else {
															if (toDezenas <= 89) {
																NSString* oitoD = [mainDict objectForKey:@"8d"];
																dezenaDia.image = [UIImage imageNamed:oitoD];
															}
															else {
																if (toDezenas <= 99) {
																	NSString* noveD = [mainDict objectForKey:@"9d"];
																	dezenaDia.image = [UIImage imageNamed:noveD];
																}
															}
															
														}
														
													}
													
												}
												
											}
											
										}
										
									}
									
								}
								
							}
								//unidades
							int toUnits = toDezenas ;
							for (toUnits; toUnits >= 10;) {
								toUnits = toUnits - 10 ;
							}
							if (toUnits == 0 ) {
								NSString* zeroD = [mainDict objectForKey:@"0d"];
								unidadeDia.image = [UIImage imageNamed:zeroD];
							}
							else {
								if (toUnits == 1) {
									NSString* umD = [mainDict objectForKey:@"1d"];
									unidadeDia.image = [UIImage imageNamed:umD];
								}
								else {
									if (toUnits == 2) {
										NSString* doisD = [mainDict objectForKey:@"2d"];
										unidadeDia.image = [UIImage imageNamed:doisD];
									}
									else {
										if (toUnits == 3) {
											NSString* tresD = [mainDict objectForKey:@"3d"];
											unidadeDia.image = [UIImage imageNamed:tresD];
										}
										else {
											if (toUnits == 4) {
												NSString* quatroD = [mainDict objectForKey:@"4d"];
												unidadeDia.image = [UIImage imageNamed:quatroD];
											}
											else {
												if (toUnits == 5) {
													NSString* cincoD = [mainDict objectForKey:@"5d"];
													unidadeDia.image = [UIImage imageNamed:cincoD];
												}
												else {
													if (toUnits == 6) {
														NSString* seisD = [mainDict objectForKey:@"6d"];
														unidadeDia.image = [UIImage imageNamed:seisD];
													}
													else {
														if (toUnits == 7) {
															NSString* seteD = [mainDict objectForKey:@"7d"];
															unidadeDia.image = [UIImage imageNamed:seteD];
														}
														else {
															if (toUnits == 8) {
																NSString* oitoD = [mainDict objectForKey:@"8d"];
																unidadeDia.image = [UIImage imageNamed:oitoD];
															}
															else {
																if (toUnits == 9) {
																	NSString* noveD = [mainDict objectForKey:@"9d"];
																	unidadeDia.image = [UIImage imageNamed:noveD];
																}
															}
															
														}
														
													}
													
												}
												
											}
											
										}
										
									}
									
								}
								
							}
								//finalizei os dias
								//MINUTOS
								//dezena
							if (minToCentenario <= 9 ) {
								NSString* zeroT = [mainDict objectForKey:@"0t"];
								dezenaMin.image = [UIImage imageNamed:zeroT];
							}
							else {
								if (minToCentenario <= 19) {
									NSString* umT = [mainDict objectForKey:@"1t"];
									dezenaMin.image = [UIImage imageNamed:umT];
								}
								else {
									if (minToCentenario <= 29) {
										NSString* doisT = [mainDict objectForKey:@"2t"];
										dezenaMin.image = [UIImage imageNamed:doisT];
									}
									else {
										if (minToCentenario <= 39) {
											NSString* tresT = [mainDict objectForKey:@"3t"];
											dezenaMin.image = [UIImage imageNamed:tresT];
										}
										else {
											if (minToCentenario <= 49) {
												NSString* quatroT = [mainDict objectForKey:@"4t"];
												dezenaMin.image = [UIImage imageNamed:quatroT];
											}
											else {
												if (minToCentenario <= 59) {
													NSString* cincoT = [mainDict objectForKey:@"5t"];
													dezenaMin.image = [UIImage imageNamed:cincoT];
												}
											}
											
										}
										
									}
									
									
								}
								
							}
								//unidades
							int unitsMin = minToCentenario ;
							for (unitsMin; unitsMin >= 10;) {
								unitsMin = unitsMin - 10 ;
							}
							if (unitsMin == 0) {
								NSString* zeroT = [mainDict objectForKey:@"0t"];
								unidadeMin.image = [UIImage imageNamed:zeroT];
								if (minToCentenario == 60) {
								}
							}
							else {
								if (unitsMin == 1) {
									NSString* umT = [mainDict objectForKey:@"1t"];
									unidadeMin.image = [UIImage imageNamed:umT];
								}
								else {
									if (unitsMin == 2) {
										NSString* doisT = [mainDict objectForKey:@"2t"];
										unidadeMin.image = [UIImage imageNamed:doisT];
									}
									else {
										if (unitsMin == 3) {
											NSString* tresT = [mainDict objectForKey:@"3t"];
											unidadeMin.image = [UIImage imageNamed:tresT];
										}
										else {
											if (unitsMin == 4) {
												NSString* quatroT = [mainDict objectForKey:@"4t"];
												unidadeMin.image = [UIImage imageNamed:quatroT];
											}
											else {
												if (unitsMin == 5) {
													NSString* cincoT = [mainDict objectForKey:@"5t"];
													unidadeMin.image = [UIImage imageNamed:cincoT];
												}
												else {
													if (unitsMin == 6) {
														NSString* seisT = [mainDict objectForKey:@"6t"];
														unidadeMin.image = [UIImage imageNamed:seisT];
													}
													else {
														if (unitsMin == 7) {
															NSString* seteT = [mainDict objectForKey:@"7t"];
															unidadeMin.image = [UIImage imageNamed:seteT];
														}
														else {
															if (unitsMin == 8) {
																NSString* oitoT = [mainDict objectForKey:@"8t"];
																unidadeMin.image = [UIImage imageNamed:oitoT];
															}
															else {
																if (unitsMin == 9) {
																	NSString* noveT = [mainDict objectForKey:@"9t"];
																	unidadeMin.image = [UIImage imageNamed:noveT];
																}
															}
															
														}
														
													}
													
												}
												
											}
											
										}
										
									}
									
								}
							}
								//finalizei minutos
								//HORA
								//dezena
							if (horaToCentenario <= 9 ) {
								NSString* zeroT = [mainDict objectForKey:@"0t"];
								dezenaHora.image = [UIImage imageNamed:zeroT];
							}
							else {
								if (horaToCentenario <= 19) {
									NSString* umT = [mainDict objectForKey:@"1t"];
									dezenaHora.image = [UIImage imageNamed:umT];
								}
								else {
									NSString* doisT = [mainDict objectForKey:@"2t"];
									dezenaHora.image = [UIImage imageNamed:doisT];
								}
								
							}
								//unidades
							int unitsHour = horaToCentenario ; 
							for (unitsHour; unitsHour >= 10;) {
								unitsHour = unitsHour - 10 ;
							}
							if (unitsHour == 0) {
								NSString* zeroT = [mainDict objectForKey:@"0t"];
								unidadeHora.image = [UIImage imageNamed:zeroT];
							}
							else {
								if (unitsHour == 1) {
									NSString* umT = [mainDict objectForKey:@"1t"];
									unidadeHora.image = [UIImage imageNamed:umT];
								}
								else {
									if (unitsHour == 2) {
										NSString* doisT = [mainDict objectForKey:@"2t"];
										unidadeHora.image = [UIImage imageNamed:doisT];
									}
									else {
										if (unitsHour == 3) {
											NSString* tresT = [mainDict objectForKey:@"3t"];
											unidadeHora.image = [UIImage imageNamed:tresT];
										}
										else {
											if (unitsHour == 4) {
												NSString* quatroT = [mainDict objectForKey:@"4t"];
												unidadeHora.image = [UIImage imageNamed:quatroT];
											}
											else {
												if (unitsHour == 5) {
													NSString* cincoT = [mainDict objectForKey:@"5t"];
													unidadeHora.image = [UIImage imageNamed:cincoT];
												}
												else {
													if (unitsHour == 6) {
														NSString* seisT = [mainDict objectForKey:@"6t"];
														unidadeHora.image = [UIImage imageNamed:seisT];
													}
													else {
														if (unitsHour == 7) {
															NSString* seteT = [mainDict objectForKey:@"7t"];
															unidadeHora.image = [UIImage imageNamed:seteT];
														}
														else {
															if (unitsHour == 8) {
																NSString* oitoT = [mainDict objectForKey:@"8t"];
																unidadeHora.image = [UIImage imageNamed:oitoT];
															}
															else {
																if (unitsHour == 9) {
																	NSString* noveT = [mainDict objectForKey:@"9t"];
																	unidadeHora.image = [UIImage imageNamed:noveT];
																}
															}
															
														}
														
													}
													
												}
												
											}
											
										}
										
									}
									
								}
								
							}
								//finalizei Hora 
								//SEGUNDOS
								//dezena
							if (secToCentenario <= 9 ) {
								NSString* zeroT = [mainDict objectForKey:@"0t"];
								dezenaSeg.image = [UIImage imageNamed:zeroT];
							}
							else {
								if (secToCentenario <= 19) {
									NSString* umT = [mainDict objectForKey:@"1t"];
									dezenaSeg.image = [UIImage imageNamed:umT];
								}
								else {
									if (secToCentenario <= 29) {
										NSString* doisT = [mainDict objectForKey:@"2t"];
										dezenaSeg.image = [UIImage imageNamed:doisT];
									}
									else {
										if (secToCentenario <= 39) {
											NSString* tresT = [mainDict objectForKey:@"3t"];
											dezenaSeg.image = [UIImage imageNamed:tresT];
										}
										else {
											if (secToCentenario <= 49) {
												NSString* quatroT = [mainDict objectForKey:@"4t"];
												dezenaSeg.image = [UIImage imageNamed:quatroT];
											}
											else {
												if (secToCentenario <= 59) {
													NSString* cincoT = [mainDict objectForKey:@"5t"];
													dezenaSeg.image = [UIImage imageNamed:cincoT];
												}
											}
											
										}
										
									}
									
									
								}
								
							}		
								//unidades
							int unitsSec = secToCentenario ;
							for (unitsSec; unitsSec >= 10;) {
								unitsSec = unitsSec - 10 ;
							}
							if (unitsSec == 0) {
								NSString* zeroT = [mainDict objectForKey:@"0t"];
								unidadeSeg.image = [UIImage imageNamed:zeroT];
							}
							else {
								if (unitsSec == 1) {
									NSString* umT = [mainDict objectForKey:@"1t"];
									unidadeSeg.image = [UIImage imageNamed:umT];
								}
								else {
									if (unitsSec == 2) {
										NSString* doisT = [mainDict objectForKey:@"2t"];
										unidadeSeg.image = [UIImage imageNamed:doisT];
									}
									else {
										if (unitsSec == 3) {
											NSString* tresT = [mainDict objectForKey:@"3t"];
											unidadeSeg.image = [UIImage imageNamed:tresT];
										}
										else {
											if (unitsSec == 4) {
												NSString* quatroT = [mainDict objectForKey:@"4t"];
												unidadeSeg.image = [UIImage imageNamed:quatroT];
											}
											else {
												if (unitsSec == 5) {
													NSString* cincoT = [mainDict objectForKey:@"5t"];
													unidadeSeg.image = [UIImage imageNamed:cincoT];
												}
												else {
													if (unitsSec == 6) {
														NSString* seisT = [mainDict objectForKey:@"6t"];
														unidadeSeg.image = [UIImage imageNamed:seisT];
													}
													else {
														if (unitsSec == 7) {
															NSString* seteT = [mainDict objectForKey:@"7t"];
															unidadeSeg.image = [UIImage imageNamed:seteT];
														}
														else {
															if (unitsSec == 8) {
																NSString* oitoT = [mainDict objectForKey:@"8t"];
																unidadeSeg.image = [UIImage imageNamed:oitoT];
															}
															else {
																if (unitsSec == 9) {
																	NSString* noveT = [mainDict objectForKey:@"9t"];
																	unidadeSeg.image = [UIImage imageNamed:noveT];
																}
															}
															
														}
														
													}
													
												}
												
											}
											
										}
										
									}
									
								}
								
							}
							
						}
						
						
					}
					else {
						
						NSLog(@"%i",secToCentenario);
							//DIAS
							//centenas
						if (diasInt <= 99) {
							NSString* zeroD = [mainDict objectForKey:@"0d"];
							centenaDia.image = [UIImage imageNamed:zeroD]; 
						}
						else {
							if (diasInt <= 199) {
								NSString* umD = [mainDict objectForKey:@"1d"];
								centenaDia.image = [UIImage imageNamed:umD];
							}
							else {
								if (diasInt <= 299) {
									NSString* doisD = [mainDict objectForKey:@"2d"];
									centenaDia.image = [UIImage imageNamed:doisD];
								}
								else {
									if (diasInt <= 399) {
										NSString* tresD = [mainDict objectForKey:@"3d"];
										centenaDia.image = [UIImage imageNamed:tresD];
									}
								}
								
							}
							
						}
							//dezenas
						int toDezenas = diasInt ;
						for (toDezenas; toDezenas >= 100;) {
							NSLog(@"%i",toDezenas);
							toDezenas = toDezenas - 100 ;
						}
						if (toDezenas <= 9 ) {
							NSString* zeroD = [mainDict objectForKey:@"0d"];
							dezenaDia.image = [UIImage imageNamed:zeroD];
						}
						else {
							if (toDezenas <= 19) {
								NSString* umD = [mainDict objectForKey:@"1d"];
								dezenaDia.image = [UIImage imageNamed:umD];
							}
							else {
								if (toDezenas <= 29) {
									NSString* doisD = [mainDict objectForKey:@"2d"];
									dezenaDia.image = [UIImage imageNamed:doisD];
								}
								else {
									if (toDezenas <= 39) {
										NSString* tresD = [mainDict objectForKey:@"3d"];
										dezenaDia.image = [UIImage imageNamed:tresD];
									}
									else {
										if (toDezenas <= 49) {
											NSString* quatroD = [mainDict objectForKey:@"4d"];
											dezenaDia.image = [UIImage imageNamed:quatroD];
										}
										else {
											if (toDezenas <= 59) {
												NSString* cincoD = [mainDict objectForKey:@"5d"];
												dezenaDia.image = [UIImage imageNamed:cincoD];
											}
											else {
												if (toDezenas <= 69) {
													NSString* seisD = [mainDict objectForKey:@"6d"];
													dezenaDia.image = [UIImage imageNamed:seisD];
												}
												else {
													if (toDezenas <= 79) {
														NSString* seteD = [mainDict objectForKey:@"7d"];
														dezenaDia.image = [UIImage imageNamed:seteD];
													}
													else {
														if (toDezenas <= 89) {
															NSString* oitoD = [mainDict objectForKey:@"8d"];
															dezenaDia.image = [UIImage imageNamed:oitoD];
														}
														else {
															if (toDezenas <= 99) {
																NSString* noveD = [mainDict objectForKey:@"9d"];
																dezenaDia.image = [UIImage imageNamed:noveD];
															}
														}
														
													}
													
												}
												
											}
											
										}
										
									}
									
								}
								
							}
							
						}
							//unidades
						int toUnits = toDezenas ;
						for (toUnits; toUnits >= 10;) {
							toUnits = toUnits - 10 ;
						}
						if (toUnits == 0 ) {
							NSString* zeroD = [mainDict objectForKey:@"0d"];
							unidadeDia.image = [UIImage imageNamed:zeroD];
						}
						else {
							if (toUnits == 1) {
								NSString* umD = [mainDict objectForKey:@"1d"];
								unidadeDia.image = [UIImage imageNamed:umD];
							}
							else {
								if (toUnits == 2) {
									NSString* doisD = [mainDict objectForKey:@"2d"];
									unidadeDia.image = [UIImage imageNamed:doisD];
								}
								else {
									if (toUnits == 3) {
										NSString* tresD = [mainDict objectForKey:@"3d"];
										unidadeDia.image = [UIImage imageNamed:tresD];
									}
									else {
										if (toUnits == 4) {
											NSString* quatroD = [mainDict objectForKey:@"4d"];
											unidadeDia.image = [UIImage imageNamed:quatroD];
										}
										else {
											if (toUnits == 5) {
												NSString* cincoD = [mainDict objectForKey:@"5d"];
												unidadeDia.image = [UIImage imageNamed:cincoD];
											}
											else {
												if (toUnits == 6) {
													NSString* seisD = [mainDict objectForKey:@"6d"];
													unidadeDia.image = [UIImage imageNamed:seisD];
												}
												else {
													if (toUnits == 7) {
														NSString* seteD = [mainDict objectForKey:@"7d"];
														unidadeDia.image = [UIImage imageNamed:seteD];
													}
													else {
														if (toUnits == 8) {
															NSString* oitoD = [mainDict objectForKey:@"8d"];
															unidadeDia.image = [UIImage imageNamed:oitoD];
														}
														else {
															if (toUnits == 9) {
																NSString* noveD = [mainDict objectForKey:@"9d"];
																unidadeDia.image = [UIImage imageNamed:noveD];
															}
														}
														
													}
													
												}
												
											}
											
										}
										
									}
									
								}
								
							}
							
						}
							//finalizei os dias
							//MINUTOS
							//dezena
						if (minToCentenario <= 9 ) {
							NSString* zeroT = [mainDict objectForKey:@"0t"];
							dezenaMin.image = [UIImage imageNamed:zeroT];
						}
						else {
							if (minToCentenario <= 19) {
								NSString* umT = [mainDict objectForKey:@"1t"];
								dezenaMin.image = [UIImage imageNamed:umT];
							}
							else {
								if (minToCentenario <= 29) {
									NSString* doisT = [mainDict objectForKey:@"2t"];
									dezenaMin.image = [UIImage imageNamed:doisT];
								}
								else {
									if (minToCentenario <= 39) {
										NSString* tresT = [mainDict objectForKey:@"3t"];
										dezenaMin.image = [UIImage imageNamed:tresT];
									}
									else {
										if (minToCentenario <= 49) {
											NSString* quatroT = [mainDict objectForKey:@"4t"];
											dezenaMin.image = [UIImage imageNamed:quatroT];
										}
										else {
											if (minToCentenario <= 59) {
												NSString* cincoT = [mainDict objectForKey:@"5t"];
												dezenaMin.image = [UIImage imageNamed:cincoT];
											}
										}
										
									}
									
								}
								
								
							}
							
						}
							//unidades
						int unitsMin = minToCentenario ;
						for (unitsMin; unitsMin >= 10;) {
							unitsMin = unitsMin - 10 ;
						}
						if (unitsMin == 0) {
							NSString* zeroT = [mainDict objectForKey:@"0t"];
							unidadeMin.image = [UIImage imageNamed:zeroT];
							if (minToCentenario == 60) {
							}
						}
						else {
							if (unitsMin == 1) {
								NSString* umT = [mainDict objectForKey:@"1t"];
								unidadeMin.image = [UIImage imageNamed:umT];
							}
							else {
								if (unitsMin == 2) {
									NSString* doisT = [mainDict objectForKey:@"2t"];
									unidadeMin.image = [UIImage imageNamed:doisT];
								}
								else {
									if (unitsMin == 3) {
										NSString* tresT = [mainDict objectForKey:@"3t"];
										unidadeMin.image = [UIImage imageNamed:tresT];
									}
									else {
										if (unitsMin == 4) {
											NSString* quatroT = [mainDict objectForKey:@"4t"];
											unidadeMin.image = [UIImage imageNamed:quatroT];
										}
										else {
											if (unitsMin == 5) {
												NSString* cincoT = [mainDict objectForKey:@"5t"];
												unidadeMin.image = [UIImage imageNamed:cincoT];
											}
											else {
												if (unitsMin == 6) {
													NSString* seisT = [mainDict objectForKey:@"6t"];
													unidadeMin.image = [UIImage imageNamed:seisT];
												}
												else {
													if (unitsMin == 7) {
														NSString* seteT = [mainDict objectForKey:@"7t"];
														unidadeMin.image = [UIImage imageNamed:seteT];
													}
													else {
														if (unitsMin == 8) {
															NSString* oitoT = [mainDict objectForKey:@"8t"];
															unidadeMin.image = [UIImage imageNamed:oitoT];
														}
														else {
															if (unitsMin == 9) {
																NSString* noveT = [mainDict objectForKey:@"9t"];
																unidadeMin.image = [UIImage imageNamed:noveT];
															}
														}
														
													}
													
												}
												
											}
											
										}
										
									}
									
								}
								
							}
						}
							//finalizei minutos
							//HORA
							//dezena
						if (horaToCentenario <= 9 ) {
							NSString* zeroT = [mainDict objectForKey:@"0t"];
							dezenaHora.image = [UIImage imageNamed:zeroT];
						}
						else {
							if (horaToCentenario <= 19) {
								NSString* umT = [mainDict objectForKey:@"1t"];
								dezenaHora.image = [UIImage imageNamed:umT];
							}
							else {
								NSString* doisT = [mainDict objectForKey:@"2t"];
								dezenaHora.image = [UIImage imageNamed:doisT];
							}
							
						}
							//unidades
						int unitsHour = horaToCentenario ; 
						for (unitsHour; unitsHour >= 10;) {
							unitsHour = unitsHour - 10 ;
						}
						if (unitsHour == 0) {
							NSString* zeroT = [mainDict objectForKey:@"0t"];
							unidadeHora.image = [UIImage imageNamed:zeroT];
						}
						else {
							if (unitsHour == 1) {
								NSString* umT = [mainDict objectForKey:@"1t"];
								unidadeHora.image = [UIImage imageNamed:umT];
							}
							else {
								if (unitsHour == 2) {
									NSString* doisT = [mainDict objectForKey:@"2t"];
									unidadeHora.image = [UIImage imageNamed:doisT];
								}
								else {
									if (unitsHour == 3) {
										NSString* tresT = [mainDict objectForKey:@"3t"];
										unidadeHora.image = [UIImage imageNamed:tresT];
									}
									else {
										if (unitsHour == 4) {
											NSString* quatroT = [mainDict objectForKey:@"4t"];
											unidadeHora.image = [UIImage imageNamed:quatroT];
										}
										else {
											if (unitsHour == 5) {
												NSString* cincoT = [mainDict objectForKey:@"5t"];
												unidadeHora.image = [UIImage imageNamed:cincoT];
											}
											else {
												if (unitsHour == 6) {
													NSString* seisT = [mainDict objectForKey:@"6t"];
													unidadeHora.image = [UIImage imageNamed:seisT];
												}
												else {
													if (unitsHour == 7) {
														NSString* seteT = [mainDict objectForKey:@"7t"];
														unidadeHora.image = [UIImage imageNamed:seteT];
													}
													else {
														if (unitsHour == 8) {
															NSString* oitoT = [mainDict objectForKey:@"8t"];
															unidadeHora.image = [UIImage imageNamed:oitoT];
														}
														else {
															if (unitsHour == 9) {
																NSString* noveT = [mainDict objectForKey:@"9t"];
																unidadeHora.image = [UIImage imageNamed:noveT];
															}
														}
														
													}
													
												}
												
											}
											
										}
										
									}
									
								}
								
							}
							
						}
							//finalizei Hora 
							//SEGUNDOS
							//dezena
						if (secToCentenario <= 9 ) {
							NSString* zeroT = [mainDict objectForKey:@"0t"];
							dezenaSeg.image = [UIImage imageNamed:zeroT];
						}
						else {
							if (secToCentenario <= 19) {
								NSString* umT = [mainDict objectForKey:@"1t"];
								dezenaSeg.image = [UIImage imageNamed:umT];
							}
							else {
								if (secToCentenario <= 29) {
									NSString* doisT = [mainDict objectForKey:@"2t"];
									dezenaSeg.image = [UIImage imageNamed:doisT];
								}
								else {
									if (secToCentenario <= 39) {
										NSString* tresT = [mainDict objectForKey:@"3t"];
										dezenaSeg.image = [UIImage imageNamed:tresT];
									}
									else {
										if (secToCentenario <= 49) {
											NSString* quatroT = [mainDict objectForKey:@"4t"];
											dezenaSeg.image = [UIImage imageNamed:quatroT];
										}
										else {
											if (secToCentenario <= 59) {
												NSString* cincoT = [mainDict objectForKey:@"5t"];
												dezenaSeg.image = [UIImage imageNamed:cincoT];
											}
										}
										
									}
									
								}
								
								
							}
							
						}		
							//unidades
						int unitsSec = secToCentenario ;
						for (unitsSec; unitsSec >= 10;) {
							unitsSec = unitsSec - 10 ;
						}
						if (unitsSec == 0) {
							NSString* zeroT = [mainDict objectForKey:@"0t"];
							unidadeSeg.image = [UIImage imageNamed:zeroT];
						}
						else {
							if (unitsSec == 1) {
								NSString* umT = [mainDict objectForKey:@"1t"];
								unidadeSeg.image = [UIImage imageNamed:umT];
							}
							else {
								if (unitsSec == 2) {
									NSString* doisT = [mainDict objectForKey:@"2t"];
									unidadeSeg.image = [UIImage imageNamed:doisT];
								}
								else {
									if (unitsSec == 3) {
										NSString* tresT = [mainDict objectForKey:@"3t"];
										unidadeSeg.image = [UIImage imageNamed:tresT];
									}
									else {
										if (unitsSec == 4) {
											NSString* quatroT = [mainDict objectForKey:@"4t"];
											unidadeSeg.image = [UIImage imageNamed:quatroT];
										}
										else {
											if (unitsSec == 5) {
												NSString* cincoT = [mainDict objectForKey:@"5t"];
												unidadeSeg.image = [UIImage imageNamed:cincoT];
											}
											else {
												if (unitsSec == 6) {
													NSString* seisT = [mainDict objectForKey:@"6t"];
													unidadeSeg.image = [UIImage imageNamed:seisT];
												}
												else {
													if (unitsSec == 7) {
														NSString* seteT = [mainDict objectForKey:@"7t"];
														unidadeSeg.image = [UIImage imageNamed:seteT];
													}
													else {
														if (unitsSec == 8) {
															NSString* oitoT = [mainDict objectForKey:@"8t"];
															unidadeSeg.image = [UIImage imageNamed:oitoT];
														}
														else {
															if (unitsSec == 9) {
																NSString* noveT = [mainDict objectForKey:@"9t"];
																unidadeSeg.image = [UIImage imageNamed:noveT];
															}
														}
														
													}
													
												}
												
											}
											
										}
										
									}
									
								}
								
							}
							
						}
						
					}
					
				}
				else {
					
					NSLog(@"%i",secToCentenario);
						//DIAS
						//centenas
					if (diasInt <= 99) {
						NSString* zeroD = [mainDict objectForKey:@"0d"];
						centenaDia.image = [UIImage imageNamed:zeroD]; 
					}
					else {
						if (diasInt <= 199) {
							NSString* umD = [mainDict objectForKey:@"1d"];
							centenaDia.image = [UIImage imageNamed:umD];
						}
						else {
							if (diasInt <= 299) {
								NSString* doisD = [mainDict objectForKey:@"2d"];
								centenaDia.image = [UIImage imageNamed:doisD];
							}
							else {
								if (diasInt <= 399) {
									NSString* tresD = [mainDict objectForKey:@"3d"];
									centenaDia.image = [UIImage imageNamed:tresD];
								}
							}
							
						}
						
					}
						//dezenas
					int toDezenas = diasInt ;
					for (toDezenas; toDezenas >= 100;) {
						NSLog(@"%i",toDezenas);
						toDezenas = toDezenas - 100 ;
					}
					if (toDezenas <= 9 ) {
						NSString* zeroD = [mainDict objectForKey:@"0d"];
						dezenaDia.image = [UIImage imageNamed:zeroD];
					}
					else {
						if (toDezenas <= 19) {
							NSString* umD = [mainDict objectForKey:@"1d"];
							dezenaDia.image = [UIImage imageNamed:umD];
						}
						else {
							if (toDezenas <= 29) {
								NSString* doisD = [mainDict objectForKey:@"2d"];
								dezenaDia.image = [UIImage imageNamed:doisD];
							}
							else {
								if (toDezenas <= 39) {
									NSString* tresD = [mainDict objectForKey:@"3d"];
									dezenaDia.image = [UIImage imageNamed:tresD];
								}
								else {
									if (toDezenas <= 49) {
										NSString* quatroD = [mainDict objectForKey:@"4d"];
										dezenaDia.image = [UIImage imageNamed:quatroD];
									}
									else {
										if (toDezenas <= 59) {
											NSString* cincoD = [mainDict objectForKey:@"5d"];
											dezenaDia.image = [UIImage imageNamed:cincoD];
										}
										else {
											if (toDezenas <= 69) {
												NSString* seisD = [mainDict objectForKey:@"6d"];
												dezenaDia.image = [UIImage imageNamed:seisD];
											}
											else {
												if (toDezenas <= 79) {
													NSString* seteD = [mainDict objectForKey:@"7d"];
													dezenaDia.image = [UIImage imageNamed:seteD];
												}
												else {
													if (toDezenas <= 89) {
														NSString* oitoD = [mainDict objectForKey:@"8d"];
														dezenaDia.image = [UIImage imageNamed:oitoD];
													}
													else {
														if (toDezenas <= 99) {
															NSString* noveD = [mainDict objectForKey:@"9d"];
															dezenaDia.image = [UIImage imageNamed:noveD];
														}
													}
													
												}
												
											}
											
										}
										
									}
									
								}
								
							}
							
						}
						
					}
						//unidades
					int toUnits = toDezenas ;
					for (toUnits; toUnits >= 10;) {
						toUnits = toUnits - 10 ;
					}
					if (toUnits == 0 ) {
						NSString* zeroD = [mainDict objectForKey:@"0d"];
						unidadeDia.image = [UIImage imageNamed:zeroD];
					}
					else {
						if (toUnits == 1) {
							NSString* umD = [mainDict objectForKey:@"1d"];
							unidadeDia.image = [UIImage imageNamed:umD];
						}
						else {
							if (toUnits == 2) {
								NSString* doisD = [mainDict objectForKey:@"2d"];
								unidadeDia.image = [UIImage imageNamed:doisD];
							}
							else {
								if (toUnits == 3) {
									NSString* tresD = [mainDict objectForKey:@"3d"];
									unidadeDia.image = [UIImage imageNamed:tresD];
								}
								else {
									if (toUnits == 4) {
										NSString* quatroD = [mainDict objectForKey:@"4d"];
										unidadeDia.image = [UIImage imageNamed:quatroD];
									}
									else {
										if (toUnits == 5) {
											NSString* cincoD = [mainDict objectForKey:@"5d"];
											unidadeDia.image = [UIImage imageNamed:cincoD];
										}
										else {
											if (toUnits == 6) {
												NSString* seisD = [mainDict objectForKey:@"6d"];
												unidadeDia.image = [UIImage imageNamed:seisD];
											}
											else {
												if (toUnits == 7) {
													NSString* seteD = [mainDict objectForKey:@"7d"];
													unidadeDia.image = [UIImage imageNamed:seteD];
												}
												else {
													if (toUnits == 8) {
														NSString* oitoD = [mainDict objectForKey:@"8d"];
														unidadeDia.image = [UIImage imageNamed:oitoD];
													}
													else {
														if (toUnits == 9) {
															NSString* noveD = [mainDict objectForKey:@"9d"];
															unidadeDia.image = [UIImage imageNamed:noveD];
														}
													}
													
												}
												
											}
											
										}
										
									}
									
								}
								
							}
							
						}
						
					}
						//finalizei os dias
						//MINUTOS
						//dezena
					if (minToCentenario <= 9 ) {
						NSString* zeroT = [mainDict objectForKey:@"0t"];
						dezenaMin.image = [UIImage imageNamed:zeroT];
					}
					else {
						if (minToCentenario <= 19) {
							NSString* umT = [mainDict objectForKey:@"1t"];
							dezenaMin.image = [UIImage imageNamed:umT];
						}
						else {
							if (minToCentenario <= 29) {
								NSString* doisT = [mainDict objectForKey:@"2t"];
								dezenaMin.image = [UIImage imageNamed:doisT];
							}
							else {
								if (minToCentenario <= 39) {
									NSString* tresT = [mainDict objectForKey:@"3t"];
									dezenaMin.image = [UIImage imageNamed:tresT];
								}
								else {
									if (minToCentenario <= 49) {
										NSString* quatroT = [mainDict objectForKey:@"4t"];
										dezenaMin.image = [UIImage imageNamed:quatroT];
									}
									else {
										if (minToCentenario <= 59) {
											NSString* cincoT = [mainDict objectForKey:@"5t"];
											dezenaMin.image = [UIImage imageNamed:cincoT];
										}
									}
									
								}
								
							}
							
							
						}
						
					}
						//unidades
					int unitsMin = minToCentenario ;
					for (unitsMin; unitsMin >= 10;) {
						unitsMin = unitsMin - 10 ;
					}
					if (unitsMin == 0) {
						NSString* zeroT = [mainDict objectForKey:@"0t"];
						unidadeMin.image = [UIImage imageNamed:zeroT];
						if (minToCentenario == 60) {
						}
					}
					else {
						if (unitsMin == 1) {
							NSString* umT = [mainDict objectForKey:@"1t"];
							unidadeMin.image = [UIImage imageNamed:umT];
						}
						else {
							if (unitsMin == 2) {
								NSString* doisT = [mainDict objectForKey:@"2t"];
								unidadeMin.image = [UIImage imageNamed:doisT];
							}
							else {
								if (unitsMin == 3) {
									NSString* tresT = [mainDict objectForKey:@"3t"];
									unidadeMin.image = [UIImage imageNamed:tresT];
								}
								else {
									if (unitsMin == 4) {
										NSString* quatroT = [mainDict objectForKey:@"4t"];
										unidadeMin.image = [UIImage imageNamed:quatroT];
									}
									else {
										if (unitsMin == 5) {
											NSString* cincoT = [mainDict objectForKey:@"5t"];
											unidadeMin.image = [UIImage imageNamed:cincoT];
										}
										else {
											if (unitsMin == 6) {
												NSString* seisT = [mainDict objectForKey:@"6t"];
												unidadeMin.image = [UIImage imageNamed:seisT];
											}
											else {
												if (unitsMin == 7) {
													NSString* seteT = [mainDict objectForKey:@"7t"];
													unidadeMin.image = [UIImage imageNamed:seteT];
												}
												else {
													if (unitsMin == 8) {
														NSString* oitoT = [mainDict objectForKey:@"8t"];
														unidadeMin.image = [UIImage imageNamed:oitoT];
													}
													else {
														if (unitsMin == 9) {
															NSString* noveT = [mainDict objectForKey:@"9t"];
															unidadeMin.image = [UIImage imageNamed:noveT];
														}
													}
													
												}
												
											}
											
										}
										
									}
									
								}
								
							}
							
						}
					}
						//finalizei minutos
						//HORA
						//dezena
					if (horaToCentenario <= 9 ) {
						NSString* zeroT = [mainDict objectForKey:@"0t"];
						dezenaHora.image = [UIImage imageNamed:zeroT];
					}
					else {
						if (horaToCentenario <= 19) {
							NSString* umT = [mainDict objectForKey:@"1t"];
							dezenaHora.image = [UIImage imageNamed:umT];
						}
						else {
							NSString* doisT = [mainDict objectForKey:@"2t"];
							dezenaHora.image = [UIImage imageNamed:doisT];
						}
						
					}
						//unidades
					int unitsHour = horaToCentenario ; 
					for (unitsHour; unitsHour >= 10;) {
						unitsHour = unitsHour - 10 ;
					}
					if (unitsHour == 0) {
						NSString* zeroT = [mainDict objectForKey:@"0t"];
						unidadeHora.image = [UIImage imageNamed:zeroT];
					}
					else {
						if (unitsHour == 1) {
							NSString* umT = [mainDict objectForKey:@"1t"];
							unidadeHora.image = [UIImage imageNamed:umT];
						}
						else {
							if (unitsHour == 2) {
								NSString* doisT = [mainDict objectForKey:@"2t"];
								unidadeHora.image = [UIImage imageNamed:doisT];
							}
							else {
								if (unitsHour == 3) {
									NSString* tresT = [mainDict objectForKey:@"3t"];
									unidadeHora.image = [UIImage imageNamed:tresT];
								}
								else {
									if (unitsHour == 4) {
										NSString* quatroT = [mainDict objectForKey:@"4t"];
										unidadeHora.image = [UIImage imageNamed:quatroT];
									}
									else {
										if (unitsHour == 5) {
											NSString* cincoT = [mainDict objectForKey:@"5t"];
											unidadeHora.image = [UIImage imageNamed:cincoT];
										}
										else {
											if (unitsHour == 6) {
												NSString* seisT = [mainDict objectForKey:@"6t"];
												unidadeHora.image = [UIImage imageNamed:seisT];
											}
											else {
												if (unitsHour == 7) {
													NSString* seteT = [mainDict objectForKey:@"7t"];
													unidadeHora.image = [UIImage imageNamed:seteT];
												}
												else {
													if (unitsHour == 8) {
														NSString* oitoT = [mainDict objectForKey:@"8t"];
														unidadeHora.image = [UIImage imageNamed:oitoT];
													}
													else {
														if (unitsHour == 9) {
															NSString* noveT = [mainDict objectForKey:@"9t"];
															unidadeHora.image = [UIImage imageNamed:noveT];
														}
													}
													
												}
												
											}
											
										}
										
									}
									
								}
								
							}
							
						}
						
					}
						//finalizei Hora 
						//SEGUNDOS
						//dezena
					if (secToCentenario <= 9 ) {
						NSString* zeroT = [mainDict objectForKey:@"0t"];
						dezenaSeg.image = [UIImage imageNamed:zeroT];
					}
					else {
						if (secToCentenario <= 19) {
							NSString* umT = [mainDict objectForKey:@"1t"];
							dezenaSeg.image = [UIImage imageNamed:umT];
						}
						else {
							if (secToCentenario <= 29) {
								NSString* doisT = [mainDict objectForKey:@"2t"];
								dezenaSeg.image = [UIImage imageNamed:doisT];
							}
							else {
								if (secToCentenario <= 39) {
									NSString* tresT = [mainDict objectForKey:@"3t"];
									dezenaSeg.image = [UIImage imageNamed:tresT];
								}
								else {
									if (secToCentenario <= 49) {
										NSString* quatroT = [mainDict objectForKey:@"4t"];
										dezenaSeg.image = [UIImage imageNamed:quatroT];
									}
									else {
										if (secToCentenario <= 59) {
											NSString* cincoT = [mainDict objectForKey:@"5t"];
											dezenaSeg.image = [UIImage imageNamed:cincoT];
										}
									}
									
								}
								
							}
							
							
						}
						
					}		
						//unidades
					int unitsSec = secToCentenario ;
					for (unitsSec; unitsSec >= 10;) {
						unitsSec = unitsSec - 10 ;
					}
					if (unitsSec == 0) {
						NSString* zeroT = [mainDict objectForKey:@"0t"];
						unidadeSeg.image = [UIImage imageNamed:zeroT];
					}
					else {
						if (unitsSec == 1) {
							NSString* umT = [mainDict objectForKey:@"1t"];
							unidadeSeg.image = [UIImage imageNamed:umT];
						}
						else {
							if (unitsSec == 2) {
								NSString* doisT = [mainDict objectForKey:@"2t"];
								unidadeSeg.image = [UIImage imageNamed:doisT];
							}
							else {
								if (unitsSec == 3) {
									NSString* tresT = [mainDict objectForKey:@"3t"];
									unidadeSeg.image = [UIImage imageNamed:tresT];
								}
								else {
									if (unitsSec == 4) {
										NSString* quatroT = [mainDict objectForKey:@"4t"];
										unidadeSeg.image = [UIImage imageNamed:quatroT];
									}
									else {
										if (unitsSec == 5) {
											NSString* cincoT = [mainDict objectForKey:@"5t"];
											unidadeSeg.image = [UIImage imageNamed:cincoT];
										}
										else {
											if (unitsSec == 6) {
												NSString* seisT = [mainDict objectForKey:@"6t"];
												unidadeSeg.image = [UIImage imageNamed:seisT];
											}
											else {
												if (unitsSec == 7) {
													NSString* seteT = [mainDict objectForKey:@"7t"];
													unidadeSeg.image = [UIImage imageNamed:seteT];
												}
												else {
													if (unitsSec == 8) {
														NSString* oitoT = [mainDict objectForKey:@"8t"];
														unidadeSeg.image = [UIImage imageNamed:oitoT];
													}
													else {
														if (unitsSec == 9) {
															NSString* noveT = [mainDict objectForKey:@"9t"];
															unidadeSeg.image = [UIImage imageNamed:noveT];
														}
													}
													
												}
												
											}
											
										}
										
									}
									
								}
								
							}
							
						}
						
					}
					
				}
				
			}
			else {
				
				NSLog(@"%i",secToCentenario);
					//DIAS
					//centenas
				if (diasInt <= 99) {
					NSString* zeroD = [mainDict objectForKey:@"0d"];
					centenaDia.image = [UIImage imageNamed:zeroD]; 
				}
				else {
					if (diasInt <= 199) {
						NSString* umD = [mainDict objectForKey:@"1d"];
						centenaDia.image = [UIImage imageNamed:umD];
					}
					else {
						if (diasInt <= 299) {
							NSString* doisD = [mainDict objectForKey:@"2d"];
							centenaDia.image = [UIImage imageNamed:doisD];
						}
						else {
							if (diasInt <= 399) {
								NSString* tresD = [mainDict objectForKey:@"3d"];
								centenaDia.image = [UIImage imageNamed:tresD];
							}
						}
						
					}
					
				}
					//dezenas
				int toDezenas = diasInt ;
				for (toDezenas; toDezenas >= 100;) {
					NSLog(@"%i",toDezenas);
					toDezenas = toDezenas - 100 ;
				}
				if (toDezenas <= 9 ) {
					NSString* zeroD = [mainDict objectForKey:@"0d"];
					dezenaDia.image = [UIImage imageNamed:zeroD];
				}
				else {
					if (toDezenas <= 19) {
						NSString* umD = [mainDict objectForKey:@"1d"];
						dezenaDia.image = [UIImage imageNamed:umD];
					}
					else {
						if (toDezenas <= 29) {
							NSString* doisD = [mainDict objectForKey:@"2d"];
							dezenaDia.image = [UIImage imageNamed:doisD];
						}
						else {
							if (toDezenas <= 39) {
								NSString* tresD = [mainDict objectForKey:@"3d"];
								dezenaDia.image = [UIImage imageNamed:tresD];
							}
							else {
								if (toDezenas <= 49) {
									NSString* quatroD = [mainDict objectForKey:@"4d"];
									dezenaDia.image = [UIImage imageNamed:quatroD];
								}
								else {
									if (toDezenas <= 59) {
										NSString* cincoD = [mainDict objectForKey:@"5d"];
										dezenaDia.image = [UIImage imageNamed:cincoD];
									}
									else {
										if (toDezenas <= 69) {
											NSString* seisD = [mainDict objectForKey:@"6d"];
											dezenaDia.image = [UIImage imageNamed:seisD];
										}
										else {
											if (toDezenas <= 79) {
												NSString* seteD = [mainDict objectForKey:@"7d"];
												dezenaDia.image = [UIImage imageNamed:seteD];
											}
											else {
												if (toDezenas <= 89) {
													NSString* oitoD = [mainDict objectForKey:@"8d"];
													dezenaDia.image = [UIImage imageNamed:oitoD];
												}
												else {
													if (toDezenas <= 99) {
														NSString* noveD = [mainDict objectForKey:@"9d"];
														dezenaDia.image = [UIImage imageNamed:noveD];
													}
												}
												
											}
											
										}
										
									}
									
								}
								
							}
							
						}
						
					}
					
				}
					//unidades
				int toUnits = toDezenas ;
				for (toUnits; toUnits >= 10;) {
					toUnits = toUnits - 10 ;
				}
				if (toUnits == 0 ) {
					NSString* zeroD = [mainDict objectForKey:@"0d"];
					unidadeDia.image = [UIImage imageNamed:zeroD];
				}
				else {
					if (toUnits == 1) {
						NSString* umD = [mainDict objectForKey:@"1d"];
						unidadeDia.image = [UIImage imageNamed:umD];
					}
					else {
						if (toUnits == 2) {
							NSString* doisD = [mainDict objectForKey:@"2d"];
							unidadeDia.image = [UIImage imageNamed:doisD];
						}
						else {
							if (toUnits == 3) {
								NSString* tresD = [mainDict objectForKey:@"3d"];
								unidadeDia.image = [UIImage imageNamed:tresD];
							}
							else {
								if (toUnits == 4) {
									NSString* quatroD = [mainDict objectForKey:@"4d"];
									unidadeDia.image = [UIImage imageNamed:quatroD];
								}
								else {
									if (toUnits == 5) {
										NSString* cincoD = [mainDict objectForKey:@"5d"];
										unidadeDia.image = [UIImage imageNamed:cincoD];
									}
									else {
										if (toUnits == 6) {
											NSString* seisD = [mainDict objectForKey:@"6d"];
											unidadeDia.image = [UIImage imageNamed:seisD];
										}
										else {
											if (toUnits == 7) {
												NSString* seteD = [mainDict objectForKey:@"7d"];
												unidadeDia.image = [UIImage imageNamed:seteD];
											}
											else {
												if (toUnits == 8) {
													NSString* oitoD = [mainDict objectForKey:@"8d"];
													unidadeDia.image = [UIImage imageNamed:oitoD];
												}
												else {
													if (toUnits == 9) {
														NSString* noveD = [mainDict objectForKey:@"9d"];
														unidadeDia.image = [UIImage imageNamed:noveD];
													}
												}
												
											}
											
										}
										
									}
									
								}
								
							}
							
						}
						
					}
					
				}
					//finalizei os dias
					//MINUTOS
					//dezena
				if (minToCentenario <= 9 ) {
					NSString* zeroT = [mainDict objectForKey:@"0t"];
					dezenaMin.image = [UIImage imageNamed:zeroT];
				}
				else {
					if (minToCentenario <= 19) {
						NSString* umT = [mainDict objectForKey:@"1t"];
						dezenaMin.image = [UIImage imageNamed:umT];
					}
					else {
						if (minToCentenario <= 29) {
							NSString* doisT = [mainDict objectForKey:@"2t"];
							dezenaMin.image = [UIImage imageNamed:doisT];
						}
						else {
							if (minToCentenario <= 39) {
								NSString* tresT = [mainDict objectForKey:@"3t"];
								dezenaMin.image = [UIImage imageNamed:tresT];
							}
							else {
								if (minToCentenario <= 49) {
									NSString* quatroT = [mainDict objectForKey:@"4t"];
									dezenaMin.image = [UIImage imageNamed:quatroT];
								}
								else {
									if (minToCentenario <= 59) {
										NSString* cincoT = [mainDict objectForKey:@"5t"];
										dezenaMin.image = [UIImage imageNamed:cincoT];
									}
								}
								
							}
							
						}
						
						
					}
					
				}
					//unidades
				int unitsMin = minToCentenario ;
				for (unitsMin; unitsMin >= 10;) {
					unitsMin = unitsMin - 10 ;
				}
				if (unitsMin == 0) {
					NSString* zeroT = [mainDict objectForKey:@"0t"];
					unidadeMin.image = [UIImage imageNamed:zeroT];
					if (minToCentenario == 60) {
					}
				}
				else {
					if (unitsMin == 1) {
						NSString* umT = [mainDict objectForKey:@"1t"];
						unidadeMin.image = [UIImage imageNamed:umT];
					}
					else {
						if (unitsMin == 2) {
							NSString* doisT = [mainDict objectForKey:@"2t"];
							unidadeMin.image = [UIImage imageNamed:doisT];
						}
						else {
							if (unitsMin == 3) {
								NSString* tresT = [mainDict objectForKey:@"3t"];
								unidadeMin.image = [UIImage imageNamed:tresT];
							}
							else {
								if (unitsMin == 4) {
									NSString* quatroT = [mainDict objectForKey:@"4t"];
									unidadeMin.image = [UIImage imageNamed:quatroT];
								}
								else {
									if (unitsMin == 5) {
										NSString* cincoT = [mainDict objectForKey:@"5t"];
										unidadeMin.image = [UIImage imageNamed:cincoT];
									}
									else {
										if (unitsMin == 6) {
											NSString* seisT = [mainDict objectForKey:@"6t"];
											unidadeMin.image = [UIImage imageNamed:seisT];
										}
										else {
											if (unitsMin == 7) {
												NSString* seteT = [mainDict objectForKey:@"7t"];
												unidadeMin.image = [UIImage imageNamed:seteT];
											}
											else {
												if (unitsMin == 8) {
													NSString* oitoT = [mainDict objectForKey:@"8t"];
													unidadeMin.image = [UIImage imageNamed:oitoT];
												}
												else {
													if (unitsMin == 9) {
														NSString* noveT = [mainDict objectForKey:@"9t"];
														unidadeMin.image = [UIImage imageNamed:noveT];
													}
												}
												
											}
											
										}
										
									}
									
								}
								
							}
							
						}
						
					}
				}
					//finalizei minutos
					//HORA
					//dezena
				if (horaToCentenario <= 9 ) {
					NSString* zeroT = [mainDict objectForKey:@"0t"];
					dezenaHora.image = [UIImage imageNamed:zeroT];
				}
				else {
					if (horaToCentenario <= 19) {
						NSString* umT = [mainDict objectForKey:@"1t"];
						dezenaHora.image = [UIImage imageNamed:umT];
					}
					else {
						NSString* doisT = [mainDict objectForKey:@"2t"];
						dezenaHora.image = [UIImage imageNamed:doisT];
					}
					
				}
					//unidades
				int unitsHour = horaToCentenario ; 
				for (unitsHour; unitsHour >= 10;) {
					unitsHour = unitsHour - 10 ;
				}
				if (unitsHour == 0) {
					NSString* zeroT = [mainDict objectForKey:@"0t"];
					unidadeHora.image = [UIImage imageNamed:zeroT];
				}
				else {
					if (unitsHour == 1) {
						NSString* umT = [mainDict objectForKey:@"1t"];
						unidadeHora.image = [UIImage imageNamed:umT];
					}
					else {
						if (unitsHour == 2) {
							NSString* doisT = [mainDict objectForKey:@"2t"];
							unidadeHora.image = [UIImage imageNamed:doisT];
						}
						else {
							if (unitsHour == 3) {
								NSString* tresT = [mainDict objectForKey:@"3t"];
								unidadeHora.image = [UIImage imageNamed:tresT];
							}
							else {
								if (unitsHour == 4) {
									NSString* quatroT = [mainDict objectForKey:@"4t"];
									unidadeHora.image = [UIImage imageNamed:quatroT];
								}
								else {
									if (unitsHour == 5) {
										NSString* cincoT = [mainDict objectForKey:@"5t"];
										unidadeHora.image = [UIImage imageNamed:cincoT];
									}
									else {
										if (unitsHour == 6) {
											NSString* seisT = [mainDict objectForKey:@"6t"];
											unidadeHora.image = [UIImage imageNamed:seisT];
										}
										else {
											if (unitsHour == 7) {
												NSString* seteT = [mainDict objectForKey:@"7t"];
												unidadeHora.image = [UIImage imageNamed:seteT];
											}
											else {
												if (unitsHour == 8) {
													NSString* oitoT = [mainDict objectForKey:@"8t"];
													unidadeHora.image = [UIImage imageNamed:oitoT];
												}
												else {
													if (unitsHour == 9) {
														NSString* noveT = [mainDict objectForKey:@"9t"];
														unidadeHora.image = [UIImage imageNamed:noveT];
													}
												}
												
											}
											
										}
										
									}
									
								}
								
							}
							
						}
						
					}
					
				}
					//finalizei Hora 
					//SEGUNDOS
					//dezena
				if (secToCentenario <= 9 ) {
					NSString* zeroT = [mainDict objectForKey:@"0t"];
					dezenaSeg.image = [UIImage imageNamed:zeroT];
				}
				else {
					if (secToCentenario <= 19) {
						NSString* umT = [mainDict objectForKey:@"1t"];
						dezenaSeg.image = [UIImage imageNamed:umT];
					}
					else {
						if (secToCentenario <= 29) {
							NSString* doisT = [mainDict objectForKey:@"2t"];
							dezenaSeg.image = [UIImage imageNamed:doisT];
						}
						else {
							if (secToCentenario <= 39) {
								NSString* tresT = [mainDict objectForKey:@"3t"];
								dezenaSeg.image = [UIImage imageNamed:tresT];
							}
							else {
								if (secToCentenario <= 49) {
									NSString* quatroT = [mainDict objectForKey:@"4t"];
									dezenaSeg.image = [UIImage imageNamed:quatroT];
								}
								else {
									if (secToCentenario <= 59) {
										NSString* cincoT = [mainDict objectForKey:@"5t"];
										dezenaSeg.image = [UIImage imageNamed:cincoT];
									}
								}
								
							}
							
						}
						
						
					}
					
				}		
					//unidades
				int unitsSec = secToCentenario ;
				for (unitsSec; unitsSec >= 10;) {
					unitsSec = unitsSec - 10 ;
				}
				if (unitsSec == 0) {
					NSString* zeroT = [mainDict objectForKey:@"0t"];
					unidadeSeg.image = [UIImage imageNamed:zeroT];
				}
				else {
					if (unitsSec == 1) {
						NSString* umT = [mainDict objectForKey:@"1t"];
						unidadeSeg.image = [UIImage imageNamed:umT];
					}
					else {
						if (unitsSec == 2) {
							NSString* doisT = [mainDict objectForKey:@"2t"];
							unidadeSeg.image = [UIImage imageNamed:doisT];
						}
						else {
							if (unitsSec == 3) {
								NSString* tresT = [mainDict objectForKey:@"3t"];
								unidadeSeg.image = [UIImage imageNamed:tresT];
							}
							else {
								if (unitsSec == 4) {
									NSString* quatroT = [mainDict objectForKey:@"4t"];
									unidadeSeg.image = [UIImage imageNamed:quatroT];
								}
								else {
									if (unitsSec == 5) {
										NSString* cincoT = [mainDict objectForKey:@"5t"];
										unidadeSeg.image = [UIImage imageNamed:cincoT];
									}
									else {
										if (unitsSec == 6) {
											NSString* seisT = [mainDict objectForKey:@"6t"];
											unidadeSeg.image = [UIImage imageNamed:seisT];
										}
										else {
											if (unitsSec == 7) {
												NSString* seteT = [mainDict objectForKey:@"7t"];
												unidadeSeg.image = [UIImage imageNamed:seteT];
											}
											else {
												if (unitsSec == 8) {
													NSString* oitoT = [mainDict objectForKey:@"8t"];
													unidadeSeg.image = [UIImage imageNamed:oitoT];
												}
												else {
													if (unitsSec == 9) {
														NSString* noveT = [mainDict objectForKey:@"9t"];
														unidadeSeg.image = [UIImage imageNamed:noveT];
													}
												}
												
											}
											
										}
										
									}
									
								}
								
							}
							
						}
						
					}
					
				}
				
			}
			
		}
		else {
			
			NSLog(@"%i",secToCentenario);
				//DIAS
				//centenas
			if (diasInt <= 99) {
				NSString* zeroD = [mainDict objectForKey:@"0d"];
				centenaDia.image = [UIImage imageNamed:zeroD]; 
			}
			else {
				if (diasInt <= 199) {
					NSString* umD = [mainDict objectForKey:@"1d"];
					centenaDia.image = [UIImage imageNamed:umD];
				}
				else {
					if (diasInt <= 299) {
						NSString* doisD = [mainDict objectForKey:@"2d"];
						centenaDia.image = [UIImage imageNamed:doisD];
					}
					else {
						if (diasInt <= 399) {
							NSString* tresD = [mainDict objectForKey:@"3d"];
							centenaDia.image = [UIImage imageNamed:tresD];
						}
					}
					
				}
				
			}
				//dezenas
			int toDezenas = diasInt ;
			for (toDezenas; toDezenas >= 100;) {
				NSLog(@"%i",toDezenas);
				toDezenas = toDezenas - 100 ;
			}
			if (toDezenas <= 9 ) {
				NSString* zeroD = [mainDict objectForKey:@"0d"];
				dezenaDia.image = [UIImage imageNamed:zeroD];
			}
			else {
				if (toDezenas <= 19) {
					NSString* umD = [mainDict objectForKey:@"1d"];
					dezenaDia.image = [UIImage imageNamed:umD];
				}
				else {
					if (toDezenas <= 29) {
						NSString* doisD = [mainDict objectForKey:@"2d"];
						dezenaDia.image = [UIImage imageNamed:doisD];
					}
					else {
						if (toDezenas <= 39) {
							NSString* tresD = [mainDict objectForKey:@"3d"];
							dezenaDia.image = [UIImage imageNamed:tresD];
						}
						else {
							if (toDezenas <= 49) {
								NSString* quatroD = [mainDict objectForKey:@"4d"];
								dezenaDia.image = [UIImage imageNamed:quatroD];
							}
							else {
								if (toDezenas <= 59) {
									NSString* cincoD = [mainDict objectForKey:@"5d"];
									dezenaDia.image = [UIImage imageNamed:cincoD];
								}
								else {
									if (toDezenas <= 69) {
										NSString* seisD = [mainDict objectForKey:@"6d"];
										dezenaDia.image = [UIImage imageNamed:seisD];
									}
									else {
										if (toDezenas <= 79) {
											NSString* seteD = [mainDict objectForKey:@"7d"];
											dezenaDia.image = [UIImage imageNamed:seteD];
										}
										else {
											if (toDezenas <= 89) {
												NSString* oitoD = [mainDict objectForKey:@"8d"];
												dezenaDia.image = [UIImage imageNamed:oitoD];
											}
											else {
												if (toDezenas <= 99) {
													NSString* noveD = [mainDict objectForKey:@"9d"];
													dezenaDia.image = [UIImage imageNamed:noveD];
												}
											}
											
										}
										
									}
									
								}
								
							}
							
						}
						
					}
					
				}
				
			}
				//unidades
			int toUnits = toDezenas ;
			for (toUnits; toUnits >= 10;) {
				toUnits = toUnits - 10 ;
			}
			if (toUnits == 0 ) {
				NSString* zeroD = [mainDict objectForKey:@"0d"];
				unidadeDia.image = [UIImage imageNamed:zeroD];
			}
			else {
				if (toUnits == 1) {
					NSString* umD = [mainDict objectForKey:@"1d"];
					unidadeDia.image = [UIImage imageNamed:umD];
				}
				else {
					if (toUnits == 2) {
						NSString* doisD = [mainDict objectForKey:@"2d"];
						unidadeDia.image = [UIImage imageNamed:doisD];
					}
					else {
						if (toUnits == 3) {
							NSString* tresD = [mainDict objectForKey:@"3d"];
							unidadeDia.image = [UIImage imageNamed:tresD];
						}
						else {
							if (toUnits == 4) {
								NSString* quatroD = [mainDict objectForKey:@"4d"];
								unidadeDia.image = [UIImage imageNamed:quatroD];
							}
							else {
								if (toUnits == 5) {
									NSString* cincoD = [mainDict objectForKey:@"5d"];
									unidadeDia.image = [UIImage imageNamed:cincoD];
								}
								else {
									if (toUnits == 6) {
										NSString* seisD = [mainDict objectForKey:@"6d"];
										unidadeDia.image = [UIImage imageNamed:seisD];
									}
									else {
										if (toUnits == 7) {
											NSString* seteD = [mainDict objectForKey:@"7d"];
											unidadeDia.image = [UIImage imageNamed:seteD];
										}
										else {
											if (toUnits == 8) {
												NSString* oitoD = [mainDict objectForKey:@"8d"];
												unidadeDia.image = [UIImage imageNamed:oitoD];
											}
											else {
												if (toUnits == 9) {
													NSString* noveD = [mainDict objectForKey:@"9d"];
													unidadeDia.image = [UIImage imageNamed:noveD];
												}
											}
											
										}
										
									}
									
								}
								
							}
							
						}
						
					}
					
				}
				
			}
				//finalizei os dias
				//MINUTOS
				//dezena
			if (minToCentenario <= 9 ) {
				NSString* zeroT = [mainDict objectForKey:@"0t"];
				dezenaMin.image = [UIImage imageNamed:zeroT];
			}
			else {
				if (minToCentenario <= 19) {
					NSString* umT = [mainDict objectForKey:@"1t"];
					dezenaMin.image = [UIImage imageNamed:umT];
				}
				else {
					if (minToCentenario <= 29) {
						NSString* doisT = [mainDict objectForKey:@"2t"];
						dezenaMin.image = [UIImage imageNamed:doisT];
					}
					else {
						if (minToCentenario <= 39) {
							NSString* tresT = [mainDict objectForKey:@"3t"];
							dezenaMin.image = [UIImage imageNamed:tresT];
						}
						else {
							if (minToCentenario <= 49) {
								NSString* quatroT = [mainDict objectForKey:@"4t"];
								dezenaMin.image = [UIImage imageNamed:quatroT];
							}
							else {
								if (minToCentenario <= 59) {
									NSString* cincoT = [mainDict objectForKey:@"5t"];
									dezenaMin.image = [UIImage imageNamed:cincoT];
								}
							}
							
						}
						
					}
					
					
				}
				
			}
				//unidades
			int unitsMin = minToCentenario ;
			for (unitsMin; unitsMin >= 10;) {
				unitsMin = unitsMin - 10 ;
			}
			if (unitsMin == 0) {
				NSString* zeroT = [mainDict objectForKey:@"0t"];
				unidadeMin.image = [UIImage imageNamed:zeroT];
				if (minToCentenario == 60) {
				}
			}
			else {
				if (unitsMin == 1) {
					NSString* umT = [mainDict objectForKey:@"1t"];
					unidadeMin.image = [UIImage imageNamed:umT];
				}
				else {
					if (unitsMin == 2) {
						NSString* doisT = [mainDict objectForKey:@"2t"];
						unidadeMin.image = [UIImage imageNamed:doisT];
					}
					else {
						if (unitsMin == 3) {
							NSString* tresT = [mainDict objectForKey:@"3t"];
							unidadeMin.image = [UIImage imageNamed:tresT];
						}
						else {
							if (unitsMin == 4) {
								NSString* quatroT = [mainDict objectForKey:@"4t"];
								unidadeMin.image = [UIImage imageNamed:quatroT];
							}
							else {
								if (unitsMin == 5) {
									NSString* cincoT = [mainDict objectForKey:@"5t"];
									unidadeMin.image = [UIImage imageNamed:cincoT];
								}
								else {
									if (unitsMin == 6) {
										NSString* seisT = [mainDict objectForKey:@"6t"];
										unidadeMin.image = [UIImage imageNamed:seisT];
									}
									else {
										if (unitsMin == 7) {
											NSString* seteT = [mainDict objectForKey:@"7t"];
											unidadeMin.image = [UIImage imageNamed:seteT];
										}
										else {
											if (unitsMin == 8) {
												NSString* oitoT = [mainDict objectForKey:@"8t"];
												unidadeMin.image = [UIImage imageNamed:oitoT];
											}
											else {
												if (unitsMin == 9) {
													NSString* noveT = [mainDict objectForKey:@"9t"];
													unidadeMin.image = [UIImage imageNamed:noveT];
												}
											}
											
										}
										
									}
									
								}
								
							}
							
						}
						
					}
					
				}
			}
				//finalizei minutos
				//HORA
				//dezena
			if (horaToCentenario <= 9 ) {
				NSString* zeroT = [mainDict objectForKey:@"0t"];
				dezenaHora.image = [UIImage imageNamed:zeroT];
			}
			else {
				if (horaToCentenario <= 19) {
					NSString* umT = [mainDict objectForKey:@"1t"];
					dezenaHora.image = [UIImage imageNamed:umT];
				}
				else {
					NSString* doisT = [mainDict objectForKey:@"2t"];
					dezenaHora.image = [UIImage imageNamed:doisT];
				}
				
			}
				//unidades
			int unitsHour = horaToCentenario ; 
			for (unitsHour; unitsHour >= 10;) {
				unitsHour = unitsHour - 10 ;
			}
			if (unitsHour == 0) {
				NSString* zeroT = [mainDict objectForKey:@"0t"];
				unidadeHora.image = [UIImage imageNamed:zeroT];
			}
			else {
				if (unitsHour == 1) {
					NSString* umT = [mainDict objectForKey:@"1t"];
					unidadeHora.image = [UIImage imageNamed:umT];
				}
				else {
					if (unitsHour == 2) {
						NSString* doisT = [mainDict objectForKey:@"2t"];
						unidadeHora.image = [UIImage imageNamed:doisT];
					}
					else {
						if (unitsHour == 3) {
							NSString* tresT = [mainDict objectForKey:@"3t"];
							unidadeHora.image = [UIImage imageNamed:tresT];
						}
						else {
							if (unitsHour == 4) {
								NSString* quatroT = [mainDict objectForKey:@"4t"];
								unidadeHora.image = [UIImage imageNamed:quatroT];
							}
							else {
								if (unitsHour == 5) {
									NSString* cincoT = [mainDict objectForKey:@"5t"];
									unidadeHora.image = [UIImage imageNamed:cincoT];
								}
								else {
									if (unitsHour == 6) {
										NSString* seisT = [mainDict objectForKey:@"6t"];
										unidadeHora.image = [UIImage imageNamed:seisT];
									}
									else {
										if (unitsHour == 7) {
											NSString* seteT = [mainDict objectForKey:@"7t"];
											unidadeHora.image = [UIImage imageNamed:seteT];
										}
										else {
											if (unitsHour == 8) {
												NSString* oitoT = [mainDict objectForKey:@"8t"];
												unidadeHora.image = [UIImage imageNamed:oitoT];
											}
											else {
												if (unitsHour == 9) {
													NSString* noveT = [mainDict objectForKey:@"9t"];
													unidadeHora.image = [UIImage imageNamed:noveT];
												}
											}
											
										}
										
									}
									
								}
								
							}
							
						}
						
					}
					
				}
				
			}
				//finalizei Hora 
				//SEGUNDOS
				//dezena
			if (secToCentenario <= 9 ) {
				NSString* zeroT = [mainDict objectForKey:@"0t"];
				dezenaSeg.image = [UIImage imageNamed:zeroT];
			}
			else {
				if (secToCentenario <= 19) {
					NSString* umT = [mainDict objectForKey:@"1t"];
					dezenaSeg.image = [UIImage imageNamed:umT];
				}
				else {
					if (secToCentenario <= 29) {
						NSString* doisT = [mainDict objectForKey:@"2t"];
						dezenaSeg.image = [UIImage imageNamed:doisT];
					}
					else {
						if (secToCentenario <= 39) {
							NSString* tresT = [mainDict objectForKey:@"3t"];
							dezenaSeg.image = [UIImage imageNamed:tresT];
						}
						else {
							if (secToCentenario <= 49) {
								NSString* quatroT = [mainDict objectForKey:@"4t"];
								dezenaSeg.image = [UIImage imageNamed:quatroT];
							}
							else {
								if (secToCentenario <= 59) {
									NSString* cincoT = [mainDict objectForKey:@"5t"];
									dezenaSeg.image = [UIImage imageNamed:cincoT];
								}
							}
							
						}
						
					}
					
					
				}
				
			}		
				//unidades
			int unitsSec = secToCentenario ;
			for (unitsSec; unitsSec >= 10;) {
				unitsSec = unitsSec - 10 ;
			}
			if (unitsSec == 0) {
				NSString* zeroT = [mainDict objectForKey:@"0t"];
				unidadeSeg.image = [UIImage imageNamed:zeroT];
			}
			else {
				if (unitsSec == 1) {
					NSString* umT = [mainDict objectForKey:@"1t"];
					unidadeSeg.image = [UIImage imageNamed:umT];
				}
				else {
					if (unitsSec == 2) {
						NSString* doisT = [mainDict objectForKey:@"2t"];
						unidadeSeg.image = [UIImage imageNamed:doisT];
					}
					else {
						if (unitsSec == 3) {
							NSString* tresT = [mainDict objectForKey:@"3t"];
							unidadeSeg.image = [UIImage imageNamed:tresT];
						}
						else {
							if (unitsSec == 4) {
								NSString* quatroT = [mainDict objectForKey:@"4t"];
								unidadeSeg.image = [UIImage imageNamed:quatroT];
							}
							else {
								if (unitsSec == 5) {
									NSString* cincoT = [mainDict objectForKey:@"5t"];
									unidadeSeg.image = [UIImage imageNamed:cincoT];
								}
								else {
									if (unitsSec == 6) {
										NSString* seisT = [mainDict objectForKey:@"6t"];
										unidadeSeg.image = [UIImage imageNamed:seisT];
									}
									else {
										if (unitsSec == 7) {
											NSString* seteT = [mainDict objectForKey:@"7t"];
											unidadeSeg.image = [UIImage imageNamed:seteT];
										}
										else {
											if (unitsSec == 8) {
												NSString* oitoT = [mainDict objectForKey:@"8t"];
												unidadeSeg.image = [UIImage imageNamed:oitoT];
											}
											else {
												if (unitsSec == 9) {
													NSString* noveT = [mainDict objectForKey:@"9t"];
													unidadeSeg.image = [UIImage imageNamed:noveT];
												}
											}
											
										}
										
									}
									
								}
								
							}
							
						}
						
					}
					
				}
				
			}
			
		}
		
	}
	else {
		
		NSLog(@"%i",secToCentenario);
			//DIAS
			//centenas
		if (diasInt <= 99) {
			NSString* zeroD = [mainDict objectForKey:@"0d"];
			centenaDia.image = [UIImage imageNamed:zeroD]; 
		}
		else {
			if (diasInt <= 199) {
				NSString* umD = [mainDict objectForKey:@"1d"];
				centenaDia.image = [UIImage imageNamed:umD];
			}
			else {
				if (diasInt <= 299) {
					NSString* doisD = [mainDict objectForKey:@"2d"];
					centenaDia.image = [UIImage imageNamed:doisD];
				}
				else {
					if (diasInt <= 399) {
						NSString* tresD = [mainDict objectForKey:@"3d"];
						centenaDia.image = [UIImage imageNamed:tresD];
					}
				}
				
			}
			
		}
			//dezenas
		int toDezenas = diasInt ;
		for (toDezenas; toDezenas >= 100;) {
			NSLog(@"%i",toDezenas);
			toDezenas = toDezenas - 100 ;
		}
		if (toDezenas <= 9 ) {
			NSString* zeroD = [mainDict objectForKey:@"0d"];
			dezenaDia.image = [UIImage imageNamed:zeroD];
		}
		else {
			if (toDezenas <= 19) {
				NSString* umD = [mainDict objectForKey:@"1d"];
				dezenaDia.image = [UIImage imageNamed:umD];
			}
			else {
				if (toDezenas <= 29) {
					NSString* doisD = [mainDict objectForKey:@"2d"];
					dezenaDia.image = [UIImage imageNamed:doisD];
				}
				else {
					if (toDezenas <= 39) {
						NSString* tresD = [mainDict objectForKey:@"3d"];
						dezenaDia.image = [UIImage imageNamed:tresD];
					}
					else {
						if (toDezenas <= 49) {
							NSString* quatroD = [mainDict objectForKey:@"4d"];
							dezenaDia.image = [UIImage imageNamed:quatroD];
						}
						else {
							if (toDezenas <= 59) {
								NSString* cincoD = [mainDict objectForKey:@"5d"];
								dezenaDia.image = [UIImage imageNamed:cincoD];
							}
							else {
								if (toDezenas <= 69) {
									NSString* seisD = [mainDict objectForKey:@"6d"];
									dezenaDia.image = [UIImage imageNamed:seisD];
								}
								else {
									if (toDezenas <= 79) {
										NSString* seteD = [mainDict objectForKey:@"7d"];
										dezenaDia.image = [UIImage imageNamed:seteD];
									}
									else {
										if (toDezenas <= 89) {
											NSString* oitoD = [mainDict objectForKey:@"8d"];
											dezenaDia.image = [UIImage imageNamed:oitoD];
										}
										else {
											if (toDezenas <= 99) {
												NSString* noveD = [mainDict objectForKey:@"9d"];
												dezenaDia.image = [UIImage imageNamed:noveD];
											}
										}
										
									}
									
								}
								
							}
							
						}
						
					}
					
				}
				
			}
			
		}
			//unidades
		int toUnits = toDezenas ;
		for (toUnits; toUnits >= 10;) {
			toUnits = toUnits - 10 ;
		}
		if (toUnits == 0 ) {
			NSString* zeroD = [mainDict objectForKey:@"0d"];
			unidadeDia.image = [UIImage imageNamed:zeroD];
		}
		else {
			if (toUnits == 1) {
				NSString* umD = [mainDict objectForKey:@"1d"];
				unidadeDia.image = [UIImage imageNamed:umD];
			}
			else {
				if (toUnits == 2) {
					NSString* doisD = [mainDict objectForKey:@"2d"];
					unidadeDia.image = [UIImage imageNamed:doisD];
				}
				else {
					if (toUnits == 3) {
						NSString* tresD = [mainDict objectForKey:@"3d"];
						unidadeDia.image = [UIImage imageNamed:tresD];
					}
					else {
						if (toUnits == 4) {
							NSString* quatroD = [mainDict objectForKey:@"4d"];
							unidadeDia.image = [UIImage imageNamed:quatroD];
						}
						else {
							if (toUnits == 5) {
								NSString* cincoD = [mainDict objectForKey:@"5d"];
								unidadeDia.image = [UIImage imageNamed:cincoD];
							}
							else {
								if (toUnits == 6) {
									NSString* seisD = [mainDict objectForKey:@"6d"];
									unidadeDia.image = [UIImage imageNamed:seisD];
								}
								else {
									if (toUnits == 7) {
										NSString* seteD = [mainDict objectForKey:@"7d"];
										unidadeDia.image = [UIImage imageNamed:seteD];
									}
									else {
										if (toUnits == 8) {
											NSString* oitoD = [mainDict objectForKey:@"8d"];
											unidadeDia.image = [UIImage imageNamed:oitoD];
										}
										else {
											if (toUnits == 9) {
												NSString* noveD = [mainDict objectForKey:@"9d"];
												unidadeDia.image = [UIImage imageNamed:noveD];
											}
										}
										
									}
									
								}
								
							}
							
						}
						
					}
					
				}
				
			}
			
		}
			//finalizei os dias
			//MINUTOS
			//dezena
		if (minToCentenario <= 9 ) {
			NSString* zeroT = [mainDict objectForKey:@"0t"];
			dezenaMin.image = [UIImage imageNamed:zeroT];
		}
		else {
			if (minToCentenario <= 19) {
				NSString* umT = [mainDict objectForKey:@"1t"];
				dezenaMin.image = [UIImage imageNamed:umT];
			}
			else {
				if (minToCentenario <= 29) {
					NSString* doisT = [mainDict objectForKey:@"2t"];
					dezenaMin.image = [UIImage imageNamed:doisT];
				}
				else {
					if (minToCentenario <= 39) {
						NSString* tresT = [mainDict objectForKey:@"3t"];
						dezenaMin.image = [UIImage imageNamed:tresT];
					}
					else {
						if (minToCentenario <= 49) {
							NSString* quatroT = [mainDict objectForKey:@"4t"];
							dezenaMin.image = [UIImage imageNamed:quatroT];
						}
						else {
							if (minToCentenario <= 59) {
								NSString* cincoT = [mainDict objectForKey:@"5t"];
								dezenaMin.image = [UIImage imageNamed:cincoT];
							}
						}
						
					}
					
				}
				
				
			}
			
		}
			//unidades
		int unitsMin = minToCentenario ;
		for (unitsMin; unitsMin >= 10;) {
			unitsMin = unitsMin - 10 ;
		}
		if (unitsMin == 0) {
			NSString* zeroT = [mainDict objectForKey:@"0t"];
			unidadeMin.image = [UIImage imageNamed:zeroT];
			if (minToCentenario == 60) {
			}
		}
		else {
			if (unitsMin == 1) {
				NSString* umT = [mainDict objectForKey:@"1t"];
				unidadeMin.image = [UIImage imageNamed:umT];
			}
			else {
				if (unitsMin == 2) {
					NSString* doisT = [mainDict objectForKey:@"2t"];
					unidadeMin.image = [UIImage imageNamed:doisT];
				}
				else {
					if (unitsMin == 3) {
						NSString* tresT = [mainDict objectForKey:@"3t"];
						unidadeMin.image = [UIImage imageNamed:tresT];
					}
					else {
						if (unitsMin == 4) {
							NSString* quatroT = [mainDict objectForKey:@"4t"];
							unidadeMin.image = [UIImage imageNamed:quatroT];
						}
						else {
							if (unitsMin == 5) {
								NSString* cincoT = [mainDict objectForKey:@"5t"];
								unidadeMin.image = [UIImage imageNamed:cincoT];
							}
							else {
								if (unitsMin == 6) {
									NSString* seisT = [mainDict objectForKey:@"6t"];
									unidadeMin.image = [UIImage imageNamed:seisT];
								}
								else {
									if (unitsMin == 7) {
										NSString* seteT = [mainDict objectForKey:@"7t"];
										unidadeMin.image = [UIImage imageNamed:seteT];
									}
									else {
										if (unitsMin == 8) {
											NSString* oitoT = [mainDict objectForKey:@"8t"];
											unidadeMin.image = [UIImage imageNamed:oitoT];
										}
										else {
											if (unitsMin == 9) {
												NSString* noveT = [mainDict objectForKey:@"9t"];
												unidadeMin.image = [UIImage imageNamed:noveT];
											}
										}
										
									}
									
								}
								
							}
							
						}
						
					}
					
				}
				
			}
		}
			//finalizei minutos
			//HORA
			//dezena
		if (horaToCentenario <= 9 ) {
			NSString* zeroT = [mainDict objectForKey:@"0t"];
			dezenaHora.image = [UIImage imageNamed:zeroT];
		}
		else {
			if (horaToCentenario <= 19) {
				NSString* umT = [mainDict objectForKey:@"1t"];
				dezenaHora.image = [UIImage imageNamed:umT];
			}
			else {
				NSString* doisT = [mainDict objectForKey:@"2t"];
				dezenaHora.image = [UIImage imageNamed:doisT];
			}
			
		}
			//unidades
		int unitsHour = horaToCentenario ; 
		for (unitsHour; unitsHour >= 10;) {
			unitsHour = unitsHour - 10 ;
		}
		if (unitsHour == 0) {
			NSString* zeroT = [mainDict objectForKey:@"0t"];
			unidadeHora.image = [UIImage imageNamed:zeroT];
		}
		else {
			if (unitsHour == 1) {
				NSString* umT = [mainDict objectForKey:@"1t"];
				unidadeHora.image = [UIImage imageNamed:umT];
			}
			else {
				if (unitsHour == 2) {
					NSString* doisT = [mainDict objectForKey:@"2t"];
					unidadeHora.image = [UIImage imageNamed:doisT];
				}
				else {
					if (unitsHour == 3) {
						NSString* tresT = [mainDict objectForKey:@"3t"];
						unidadeHora.image = [UIImage imageNamed:tresT];
					}
					else {
						if (unitsHour == 4) {
							NSString* quatroT = [mainDict objectForKey:@"4t"];
							unidadeHora.image = [UIImage imageNamed:quatroT];
						}
						else {
							if (unitsHour == 5) {
								NSString* cincoT = [mainDict objectForKey:@"5t"];
								unidadeHora.image = [UIImage imageNamed:cincoT];
							}
							else {
								if (unitsHour == 6) {
									NSString* seisT = [mainDict objectForKey:@"6t"];
									unidadeHora.image = [UIImage imageNamed:seisT];
								}
								else {
									if (unitsHour == 7) {
										NSString* seteT = [mainDict objectForKey:@"7t"];
										unidadeHora.image = [UIImage imageNamed:seteT];
									}
									else {
										if (unitsHour == 8) {
											NSString* oitoT = [mainDict objectForKey:@"8t"];
											unidadeHora.image = [UIImage imageNamed:oitoT];
										}
										else {
											if (unitsHour == 9) {
												NSString* noveT = [mainDict objectForKey:@"9t"];
												unidadeHora.image = [UIImage imageNamed:noveT];
											}
										}
										
									}
									
								}
								
							}
							
						}
						
					}
					
				}
				
			}
			
		}
			//finalizei Hora 
			//SEGUNDOS
			//dezena
		if (secToCentenario <= 9 ) {
			NSString* zeroT = [mainDict objectForKey:@"0t"];
			dezenaSeg.image = [UIImage imageNamed:zeroT];
		}
		else {
			if (secToCentenario <= 19) {
				NSString* umT = [mainDict objectForKey:@"1t"];
				dezenaSeg.image = [UIImage imageNamed:umT];
			}
			else {
				if (secToCentenario <= 29) {
					NSString* doisT = [mainDict objectForKey:@"2t"];
					dezenaSeg.image = [UIImage imageNamed:doisT];
				}
				else {
					if (secToCentenario <= 39) {
						NSString* tresT = [mainDict objectForKey:@"3t"];
						dezenaSeg.image = [UIImage imageNamed:tresT];
					}
					else {
						if (secToCentenario <= 49) {
							NSString* quatroT = [mainDict objectForKey:@"4t"];
							dezenaSeg.image = [UIImage imageNamed:quatroT];
						}
						else {
							if (secToCentenario <= 59) {
								NSString* cincoT = [mainDict objectForKey:@"5t"];
								dezenaSeg.image = [UIImage imageNamed:cincoT];
							}
						}
						
					}
					
				}
				
				
			}
			
		}		
			//unidades
		int unitsSec = secToCentenario ;
		for (unitsSec; unitsSec >= 10;) {
			unitsSec = unitsSec - 10 ;
		}
		if (unitsSec == 0) {
			NSString* zeroT = [mainDict objectForKey:@"0t"];
			unidadeSeg.image = [UIImage imageNamed:zeroT];
		}
		else {
			if (unitsSec == 1) {
				NSString* umT = [mainDict objectForKey:@"1t"];
				unidadeSeg.image = [UIImage imageNamed:umT];
			}
			else {
				if (unitsSec == 2) {
					NSString* doisT = [mainDict objectForKey:@"2t"];
					unidadeSeg.image = [UIImage imageNamed:doisT];
				}
				else {
					if (unitsSec == 3) {
						NSString* tresT = [mainDict objectForKey:@"3t"];
						unidadeSeg.image = [UIImage imageNamed:tresT];
					}
					else {
						if (unitsSec == 4) {
							NSString* quatroT = [mainDict objectForKey:@"4t"];
							unidadeSeg.image = [UIImage imageNamed:quatroT];
						}
						else {
							if (unitsSec == 5) {
								NSString* cincoT = [mainDict objectForKey:@"5t"];
								unidadeSeg.image = [UIImage imageNamed:cincoT];
							}
							else {
								if (unitsSec == 6) {
									NSString* seisT = [mainDict objectForKey:@"6t"];
									unidadeSeg.image = [UIImage imageNamed:seisT];
								}
								else {
									if (unitsSec == 7) {
										NSString* seteT = [mainDict objectForKey:@"7t"];
										unidadeSeg.image = [UIImage imageNamed:seteT];
									}
									else {
										if (unitsSec == 8) {
											NSString* oitoT = [mainDict objectForKey:@"8t"];
											unidadeSeg.image = [UIImage imageNamed:oitoT];
										}
										else {
											if (unitsSec == 9) {
												NSString* noveT = [mainDict objectForKey:@"9t"];
												unidadeSeg.image = [UIImage imageNamed:noveT];
											}
										}
										
									}
									
								}
								
							}
							
						}
						
					}
					
				}
				
			}
			
		}
		
	}
	
	
	[outroArray release];
	//if ([timerFake isValid] == YES) {
//		if (myFireBoolean == FALSE) {
//			[timerFake invalidate];
//				//			[timerFake release];
//			NSLog(@"Invalidei o timerFake");
//		}
//	}
		
}
else {
			[timerFake invalidate];
		NSLog(@"Invalidei o timerFake");

}

}
/*
// Override to allow orientations other than the default portrait orientation.
- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}
*/

- (void)didReceiveMemoryWarning {
	// Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
	
	// Release any cached data, images, etc that aren't in use.
}

- (void)viewDidUnload {
	// Release any retained subviews of the main view.
	// e.g. self.myOutlet = nil;
//	[timerFake release];
	[centenaDia release];
	[dezenaDia release];
	[unidadeDia release];
	[dezenaHora release];
	[unidadeHora release];
	[dezenaMin release];
	[unidadeMin release];
	[dezenaSeg release];
	[unidadeSeg release];
//	int i = 1 ; 
//	[myFireBoolean initWithInt:i];
	myFireBoolean = 99 ;
	NSLog(@"%i",myFireBoolean);
	NSLog(@"viewDidUnload do relogio");
		//	[timerFake invalidate];
	//if (myFireBoolean == FALSE) {
//		[timerFake invalidate];
//			//			[timerFake release];
//		NSLog(@"Invalidei o timerFake");
//	}
}


- (void)dealloc {
    [super dealloc];
	NSLog(@"dealloc do relogio");
	[centenaDia release];
	[dezenaDia release];
	[unidadeDia release];
	[dezenaHora release];
	[unidadeHora release];
	[dezenaMin release];
	[unidadeMin release];
	[dezenaSeg release];
	[unidadeSeg release];
//	[timerFake release];
}


@end
