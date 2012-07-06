//
//  idolosViewController.m
//  CentenarioLite
//
//  Created by Gabriel Pacheco on 13/11/09.
//  Copyright 2009 __MyCompanyName__. All rights reserved.
//

#import "idolosViewController.h"
#import "ApplicationCell.h"
#import "legendasViewController.h"

@implementation idolosViewController

@synthesize tmpCell  ;

// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad {
    [super viewDidLoad];
	NSLog(@"viewdidload");
	
	self.title = @"Ídolos" ;
	NSString* path = [[NSBundle mainBundle]pathForResource:@"idolosDB" ofType:@"plist"];
	superArray = [[NSArray alloc]initWithContentsOfFile:path];
	NSDictionary* superDict = [superArray objectAtIndex:0];
	megaArray = [superDict objectForKey:@"arrayIdolos"];
	backUpArray = [[NSMutableArray alloc]initWithArray:megaArray];
	defesaArray = [[NSMutableArray alloc]init];
	meioArray = [[NSMutableArray alloc]init];
	ataqueArray = [[NSMutableArray alloc]init];
	goleirosArray = [[NSMutableArray alloc]init];
//	[superArray release];
	idolosTableView.rowHeight = 77.0 ;
	idolosTableView.backgroundColor = [UIColor blackColor];
	idolosTableView.separatorColor = [UIColor blackColor];

	
	
	for (NSDictionary* mainDict in megaArray) {
		NSString*posicaoIdolo = [mainDict objectForKey:@"posicaoIdolo"];
		NSString* goleiroString = [NSString stringWithFormat:@"Goleiro"];
		NSComparisonResult resultGoleiro = [goleiroString compare:posicaoIdolo options:(NSCaseInsensitiveSearch)];
		if (resultGoleiro == NSOrderedSame) {
			[goleirosArray addObject:mainDict];
		}
		else {
			NSString* zagueiroString = [NSString stringWithFormat:@"Zagueiro"];
			NSComparisonResult resultZagueiro = [zagueiroString  compare:posicaoIdolo options:(NSCaseInsensitiveSearch)];
			if (resultZagueiro == NSOrderedSame) {
				[defesaArray addObject:mainDict];
			}
			else {
				NSString* lateralEString = [NSString stringWithFormat:@"Lateral-Esquerdo"];
				NSComparisonResult resultLateralE = [lateralEString compare:posicaoIdolo options:(NSCaseInsensitiveSearch|NSDiacriticInsensitiveSearch)];
				if (resultLateralE == NSOrderedSame) {
					[defesaArray addObject:mainDict];
				}
				else {
					NSString* lateralDString = [NSString stringWithFormat:@"Lateral-Direito"];
					NSComparisonResult resultLateralD = [lateralDString compare:posicaoIdolo options:(NSCaseInsensitiveSearch|NSDiacriticInsensitiveSearch)];
					if (resultLateralD == NSOrderedSame) {
						[defesaArray addObject:mainDict];
					}
					else {
						NSString* meioCampoString = [NSString stringWithFormat:@"meioCampo"];
						NSComparisonResult resultMeioCampo = [meioCampoString compare:posicaoIdolo options:(NSCaseInsensitiveSearch)];
						if (resultMeioCampo == NSOrderedSame) {
							[meioArray addObject:mainDict];
						}
						else {
							NSString* meioCampoEString = [NSString stringWithFormat:@"meioCampoEsquerda"];
							NSComparisonResult resultMeioCampoEsquerdo = [meioCampoEString compare:posicaoIdolo options:(NSCaseInsensitiveSearch)];
							if (resultMeioCampoEsquerdo == NSOrderedSame) {
								[meioArray addObject:mainDict];
							}
							else {
								NSString* meioCampoDSTring = [NSString stringWithFormat:@"meioCampoDireita"];
								NSComparisonResult resultMeioCampoDireito = [meioCampoDSTring compare:posicaoIdolo options:(NSCaseInsensitiveSearch)];
								if (resultMeioCampoDireito == NSOrderedSame) {
									[meioArray addObject:mainDict];
								}
								else {
									NSString* volateSTring = [NSString stringWithFormat:@"volante"];
									NSComparisonResult	resultVolante = [volateSTring compare:posicaoIdolo options:(NSCaseInsensitiveSearch)];
									if (resultVolante == NSOrderedSame) {
										[meioArray addObject:mainDict];

									}
									else {
										NSString* atacanteString = [NSString stringWithFormat:@"atacante"];
										NSComparisonResult resultAtacante = [atacanteString compare:posicaoIdolo options:(NSCaseInsensitiveSearch)];
										if (resultAtacante == NSOrderedSame) {
											[ataqueArray addObject:mainDict];
										}
										else {
											NSString* pontaString = [NSString stringWithFormat:@"centroAvante"];
											NSComparisonResult resultCentro = [pontaString compare:posicaoIdolo options:(NSCaseInsensitiveSearch)];
											if (resultCentro == NSOrderedSame) {
												[ataqueArray addObject:mainDict];
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
	[self reloadTela];
}


-(IBAction)legendaButton {
	
	legendasViewController* myView = [[legendasViewController alloc] initWithNibName:@"legendasViewController" bundle:nil];
	[self.navigationController pushViewController:myView animated:YES];
	[myView release];
		
}
	// Quantas sessões tenho no table view
//- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
//	return 0 ;
//}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section 
{
	return [megaArray count];
}

	// Customize the appearance of table view cells.
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath :(NSIndexPath *)indexPath 
{	
	static NSString *CellIdentifier = @"ApplicationCell";
    
    ApplicationCell *cell = (ApplicationCell *)[tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
		[[NSBundle mainBundle]loadNibNamed:@"idolosSubviewBasedApplicationCell" owner:self options:nil];
		cell = tmpCell ; 
		self.tmpCell = nil ;
		
	}
	//if (indexPath.row == 0) {
////		[self setSelected:YES animated:YES];
//		tmpCell.selected = YES;
//		NSLog(@"foi");
//	}
	NSDictionary*mainDict = [megaArray objectAtIndex:indexPath.row];
	cell.periodoJogadoString = [mainDict objectForKey:@"alfaTime"];
	cell.apelidoIdoloString = [mainDict objectForKey:@"apelidoIdolo"];
	cell.numeroCamisaString = [mainDict objectForKey:@"numeroCamisa"];
	cell.imageIdolo = [UIImage imageNamed:[mainDict objectForKey:@"imagePequena"]];
	cell.bandeiraIdolo	= [UIImage imageNamed:[mainDict objectForKey:@"nacionalidadeIdolo"]];
	
	
	return cell ;
}

//- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
//	[tmpCell setSelected:selected animated:animated];
//}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
	NSDictionary*mainDict = [megaArray objectAtIndex:indexPath.row];
	nomePlayer.text = [mainDict objectForKey:@"nomeIdolo"];
	imagePlayer.image = [UIImage imageNamed:[mainDict objectForKey:@"imageGrande"]];
	NSString* alturaDude = [mainDict objectForKey:@"alturaIdolo"];
	NSString* nA = [NSString stringWithFormat:@"n/a"];
	NSComparisonResult resultAltura = [alturaDude compare:nA options:(NSCaseInsensitiveSearch)];
	if (resultAltura == NSOrderedSame) {
		alturaPlayer.text = alturaDude ;
	}
	else {
		alturaPlayer.text = [NSString stringWithFormat:@"%@ m",alturaDude];

	}
	bornPlayer.text = [mainDict objectForKey:@"idadeIdolo"] ;
	jogosPlayer.text = [mainDict objectForKey:@"jogosIdolo"];
	golsPlayer.text = [mainDict objectForKey:@"golsIdolo"];
	NSString* pezinhoIdolo = [mainDict objectForKey:@"peIdolo"];
	NSString* destro = [NSString stringWithFormat:@"destro"];
	NSComparisonResult resultPezito = [destro compare:pezinhoIdolo options:(NSCaseInsensitiveSearch|NSDiacriticInsensitiveSearch) range:NSMakeRange(0, [pezinhoIdolo length])];
	if (resultPezito == NSOrderedSame) {
		pePlayer.image = [UIImage imageNamed:@"PD.png"];
	
		}
	else {
		pePlayer.image = [UIImage imageNamed:@"PE.png"];
	}
	NSString* glIdolo = [mainDict objectForKey:@"GLIdolo"];
	NSString* positivoString = [NSString stringWithFormat:@"sim"];
	NSComparisonResult resultGL = [positivoString compare:glIdolo options:(NSCaseInsensitiveSearch)];
	if (resultGL == NSOrderedSame) {
		glPOS.image = [UIImage imageNamed:@"GL_on.png"];
	}
	else {
		glPOS.image = [UIImage imageNamed:@"GL_off.png"];
	}
	NSString* zgIdolo = [mainDict objectForKey:@"ZGIdolo"];
	NSComparisonResult resultZG = [positivoString compare:zgIdolo options:(NSCaseInsensitiveSearch)];
	if (resultZG == NSOrderedSame) {
		zgPOS.image = [UIImage imageNamed:@"ZG_on.png"];
	}
	else {
		zgPOS.image = [UIImage imageNamed:@"ZG_off.png"];
	}
	NSString* ldIdolo = [mainDict objectForKey:@"LDIdolo"];
	NSComparisonResult resultLD = [positivoString compare:ldIdolo options:(NSCaseInsensitiveSearch)];
	if (resultLD == NSOrderedSame) {
		ldPOS.image = [UIImage imageNamed:@"LD_on.png"];
	}
	else {
		ldPOS.image = [UIImage imageNamed:@"LD_off.png"];
	}
	NSString* leIdolo = [mainDict objectForKey:@"LEIdolo"];
	NSComparisonResult resultLE = [positivoString compare:leIdolo options:(NSCaseInsensitiveSearch)];
	if (resultLE == NSOrderedSame) {
		lePOS.image = [UIImage imageNamed:@"LE_on.png"];
	}
	else {
		lePOS.image = [UIImage imageNamed:@"LE_off.png"];
	}
	NSString* vlIdolo =[mainDict objectForKey:@"VLIdolo"];
	NSComparisonResult resultVL = [positivoString compare:vlIdolo options:(NSCaseInsensitiveSearch)];
	if (resultVL == NSOrderedSame) {
		vlPOS.image = [UIImage imageNamed:@"VL_on.png"];
	}
	else {
		vlPOS.image = [UIImage imageNamed:@"VL_off.png"];
	}
	NSString* mcIdolo = [mainDict objectForKey:@"MCIdolo"];
	NSComparisonResult resultMC = [positivoString compare:mcIdolo options:(NSCaseInsensitiveSearch)];
	if (resultMC == NSOrderedSame) {
		mcPOS.image = [UIImage imageNamed:@"MC_on.png"];
	}
	else {
		mcPOS.image = [UIImage imageNamed:@"MC_off.png"];
	}
	NSString* meIdolo = [mainDict objectForKey:@"MEIdolo"];
	NSComparisonResult resultME = [positivoString compare:meIdolo options:(NSCaseInsensitiveSearch)];
	if (resultME == NSOrderedSame) {
		mePOS.image = [UIImage imageNamed:@"ME_on.png"];
	}
	else {
		mePOS.image = [UIImage imageNamed:@"ME_off.png"];
	}
	NSString* mdIdolo = [mainDict objectForKey:@"MDIdolo"];
	NSComparisonResult resultMD = [positivoString compare:mdIdolo options:(NSCaseInsensitiveSearch)];
	if (resultMD == NSOrderedSame) {
		mdPOS.image = [UIImage imageNamed:@"MD_on.png"];
	}
	else {
		mdPOS.image= [UIImage imageNamed:@"MD_off.png"];
	}
	NSString* atIdolo = [mainDict objectForKey:@"ATIdolo"];
	NSComparisonResult resultAT = [positivoString compare:atIdolo options:(NSCaseInsensitiveSearch)];
	if (resultAT == NSOrderedSame) {
		atPOS.image = [UIImage imageNamed:@"AT_on.png"];
	}
	else {
		atPOS.image = [UIImage imageNamed:@"AT_off.png"];
	}
	NSString* PLIdolo = [mainDict objectForKey:@"PLIdolo"];
	NSComparisonResult resultPL = [positivoString compare:PLIdolo options:(NSCaseInsensitiveSearch)];
	if (resultPL == NSOrderedSame) {
		plPOS.image = [UIImage imageNamed:@"CA_on.png"];
	}
	else {
		plPOS.image = [UIImage imageNamed:@"CA_off.png"];
	}
	
	NSString*posicaoIdolo = [mainDict objectForKey:@"posicaoIdolo"];
	NSString* goleiroString = [NSString stringWithFormat:@"Goleiro"];
	NSComparisonResult resultGoleiro = [goleiroString compare:posicaoIdolo options:(NSCaseInsensitiveSearch)];
	if (resultGoleiro == NSOrderedSame) {
		fieldImage.image = [UIImage imageNamed:@"gol.png"];
	}
	else {
		NSString* zagueiroString = [NSString stringWithFormat:@"Zagueiro"];
		NSComparisonResult resultZagueiro = [zagueiroString  compare:posicaoIdolo options:(NSCaseInsensitiveSearch)];
		if (resultZagueiro == NSOrderedSame) {
			fieldImage.image = [UIImage imageNamed:@"zagua.png"];

		}
		else {
			NSString* lateralEString = [NSString stringWithFormat:@"Lateral-Esquerdo"];
			NSComparisonResult resultLateralE = [lateralEString compare:posicaoIdolo options:(NSCaseInsensitiveSearch|NSDiacriticInsensitiveSearch)];
			if (resultLateralE == NSOrderedSame) {
				fieldImage.image = [UIImage imageNamed:@"laterale.png"];

			}
			else {
				NSString* lateralDString = [NSString stringWithFormat:@"Lateral-Direito"];
				NSComparisonResult resultLateralD = [lateralDString compare:posicaoIdolo options:(NSCaseInsensitiveSearch|NSDiacriticInsensitiveSearch)];
				if (resultLateralD == NSOrderedSame) {
					fieldImage.image = [UIImage imageNamed:@"laterald.png"];

				}
				else {
					NSString* meioCampoString = [NSString stringWithFormat:@"meioCampo"];
					NSComparisonResult resultMeioCampo = [meioCampoString compare:posicaoIdolo options:(NSCaseInsensitiveSearch)];
					if (resultMeioCampo == NSOrderedSame) {
						fieldImage.image = [UIImage imageNamed:@"meiocampo.png"];

					}
					else {
						NSString* meioCampoEString = [NSString stringWithFormat:@"meioCampoEsquerda"];
						NSComparisonResult resultMeioCampoEsquerdo = [meioCampoEString compare:posicaoIdolo options:(NSCaseInsensitiveSearch)];
						if (resultMeioCampoEsquerdo == NSOrderedSame) {
							fieldImage.image = [UIImage imageNamed:@"meiae.png"];

						}
						else {
							NSString* meioCampoDSTring = [NSString stringWithFormat:@"meioCampoDireita"];
							NSComparisonResult resultMeioCampoDireito = [meioCampoDSTring compare:posicaoIdolo options:(NSCaseInsensitiveSearch)];
							if (resultMeioCampoDireito == NSOrderedSame) {
								fieldImage.image = [UIImage imageNamed:@"meiad.png"];

							}
							else {
								NSString* volateSTring = [NSString stringWithFormat:@"volante"];
								NSComparisonResult	resultVolante = [volateSTring compare:posicaoIdolo options:(NSCaseInsensitiveSearch)];
								if (resultVolante == NSOrderedSame) {
									fieldImage.image = [UIImage imageNamed:@"meiadefesa.png"];

								}
								else {
									NSString* atacanteString = [NSString stringWithFormat:@"atacante"];
									NSComparisonResult resultAtacante = [atacanteString compare:posicaoIdolo options:(NSCaseInsensitiveSearch)];
									if (resultAtacante == NSOrderedSame) {
										fieldImage.image = [UIImage imageNamed:@"ataque.png"];

									}
									else {
										NSString* pontaString = [NSString stringWithFormat:@"centroAvante"];
										NSComparisonResult resultCentro = [pontaString compare:posicaoIdolo options:(NSCaseInsensitiveSearch)];
										if (resultCentro == NSOrderedSame) {
											fieldImage.image = [UIImage imageNamed:@"banheira.png"];
	
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
	
	NSNumber* mundialNum = [mainDict objectForKey:@"mundial"];
	int mundial = [mundialNum intValue];
//	NSLog(@"MUNDIAL %i",mundial);
	NSLog(@"%i mundial",mundial);
	NSNumber* paulistNun = [mainDict objectForKey:@"paulista"];
	int paulista = [paulistNun intValue];
	NSLog(@"%i paulista",paulista);
	NSNumber* brasileiroNun = [mainDict	objectForKey:@"brasileiro"];
	int brasileiro = [brasileiroNun intValue];
	NSLog(@"%i brasileiro",brasileiro);
	NSNumber* copaBrasilNum = [mainDict objectForKey:@"copaBrasil"];
	int copaBrasil = [copaBrasilNum intValue];
	NSLog(@"%i copaBrasil",copaBrasil);
//	int mundial = 0 ;
	paulistaLabel.hidden = YES ;
	paulistaTrofeuImage.hidden = YES ;
	copaBrasilLabel.hidden = YES ;
	copaBrasilTrofeuImage.hidden = YES ;
	brasileiroLabel.hidden = YES ;
	brasileiroTrofeuImage.hidden = YES ;
	mundialLabel.hidden = YES ;
	mundialTrofeuImage.hidden = YES ;
		//BAGULHO BEM FODA DOS TROFEIS 
	if (mundial == 0) {
		if (brasileiro == 0) {
			if (copaBrasil == 0) {
				if (paulista == 0) {
				}
				else {
					mundialLabel.hidden = NO ;
					mundialTrofeuImage.hidden = NO ;
					mundialLabel.text = [NSString stringWithFormat:@"x%i",paulista];
					mundialTrofeuImage.image = [UIImage imageNamed:@"paulista.png"];
				}
			}
			else {
				if (paulista == 0) {
					mundialLabel.hidden = NO ;
					mundialTrofeuImage.hidden = NO ;
					mundialLabel.text = [NSString stringWithFormat:@"x%i",copaBrasil];
					mundialTrofeuImage.image = [UIImage imageNamed:@"brasileiro.png"];
				}
				else {
					brasileiroLabel.hidden = NO ;
					brasileiroTrofeuImage.hidden = NO ;
					brasileiroLabel.text = [NSString stringWithFormat:@"x%i",paulista];
					brasileiroTrofeuImage.image = [UIImage imageNamed:@"paulista.png"];
					mundialLabel.hidden = NO ;
					mundialTrofeuImage.hidden = NO ;
					mundialLabel.text = [NSString stringWithFormat:@"x%i",copaBrasil];
					mundialTrofeuImage.image = [UIImage imageNamed:@"brasileiro.png"];
				}
			}
		}
		else {
			if (paulista == 0) {
				if (copaBrasil == 0) {
					mundialLabel.hidden = NO ;
					mundialTrofeuImage.hidden = NO ;
					mundialLabel.text = [NSString stringWithFormat:@"x%i",brasileiro];
					mundialTrofeuImage.image = [UIImage imageNamed:@"brasileiro.png"];
				}
				else {
					brasileiroLabel.hidden = NO ;
					brasileiroTrofeuImage.hidden = NO ;
					brasileiroLabel.text = [NSString stringWithFormat:@"x%i",copaBrasil];
					brasileiroTrofeuImage.image = [UIImage imageNamed:@"copadobrasil.png"];
					mundialLabel.hidden = NO ;
					mundialTrofeuImage.hidden = NO ;
					mundialLabel.text = [NSString stringWithFormat:@"x%i",brasileiro];
					mundialTrofeuImage.image = [UIImage imageNamed:@"brasileiro.png"];
				}
				
			}
			else {
				if (copaBrasil == 0) {
					mundialLabel.hidden = NO ;
					mundialTrofeuImage.hidden = NO ;
					mundialLabel.text = [NSString stringWithFormat:@"x%i",brasileiro];
					mundialTrofeuImage.image = [UIImage imageNamed:@"brasileiro.png"];
					brasileiroLabel.hidden = NO ;
					brasileiroTrofeuImage.hidden = NO ;
					brasileiroLabel.text = [NSString stringWithFormat:@"x%i",paulista];
					brasileiroTrofeuImage.image = [UIImage imageNamed:@"paulista.png"];
				}
				else {
					copaBrasilLabel.hidden = NO ;
					copaBrasilTrofeuImage.hidden = NO ;
					copaBrasilLabel.text = [NSString stringWithFormat:@"x%i",paulista];
					copaBrasilTrofeuImage.image = [UIImage imageNamed:@"paulista.png"];
					brasileiroLabel.hidden = NO ;
					brasileiroTrofeuImage.hidden = NO ;
					brasileiroLabel.text = [NSString stringWithFormat:@"x%i",copaBrasil];
					brasileiroTrofeuImage.image = [UIImage imageNamed:@"copadobrasil.png"];
					mundialLabel.hidden = NO ;
					mundialTrofeuImage.hidden = NO ;
					mundialLabel.text = [NSString stringWithFormat:@"x%i",brasileiro];
					mundialTrofeuImage.image = [UIImage imageNamed:@"brasileiro.png"];
				}
			}
		}
	}
	else {
			if (paulista == 0) {
				if (copaBrasil == 0) {
					if (brasileiro == 0) {
						mundialLabel.hidden = NO ;
						mundialTrofeuImage.hidden = NO ;
						mundialLabel.text = [NSString stringWithFormat:@"x%i",mundial];
						mundialTrofeuImage.image = [UIImage imageNamed:@"mundial.png"];
					}
					else {
						mundialLabel.hidden = NO ;
						mundialTrofeuImage.hidden = NO ;
						mundialLabel.text = [NSString stringWithFormat:@"x%i",mundial];
						mundialTrofeuImage.image = [UIImage imageNamed:@"mundial.png"];
						brasileiroLabel.hidden = NO ;
						brasileiroTrofeuImage.hidden = NO ;
						brasileiroLabel.text = [NSString stringWithFormat:@"x%i",brasileiro];
						brasileiroTrofeuImage.image = [UIImage imageNamed:@"brasileiro.png"];
					}

				}
				else {
						if (brasileiro == 0) {
							mundialLabel.hidden = NO ;
							mundialTrofeuImage.hidden = NO ;
							mundialLabel.text = [NSString stringWithFormat:@"x%i",mundial];
							mundialTrofeuImage.image = [UIImage imageNamed:@"mundial.png"];
							brasileiroLabel.hidden = NO ;
							brasileiroTrofeuImage.hidden = NO ;
							brasileiroLabel.text = [NSString stringWithFormat:@"x%i",copaBrasil];
							brasileiroTrofeuImage.image = [UIImage imageNamed:@"copadobrasil.png"];
						}
						else {
							mundialLabel.hidden = NO ;
							mundialTrofeuImage.hidden = NO ;
							mundialLabel.text = [NSString stringWithFormat:@"x%i",mundial];
							mundialTrofeuImage.image = [UIImage imageNamed:@"mundial.png"];
							brasileiroLabel.hidden = NO ;
							brasileiroTrofeuImage.hidden = NO ;
							brasileiroLabel.text = [NSString stringWithFormat:@"x%i",brasileiro];
							brasileiroTrofeuImage.image = [UIImage imageNamed:@"brasileiro.png"];
							copaBrasilLabel.hidden = NO ;
							copaBrasilTrofeuImage.hidden = NO ;
							copaBrasilLabel.text = [NSString stringWithFormat:@"x%i",copaBrasil];
							copaBrasilTrofeuImage.image = [UIImage imageNamed:@"copadobrasil.png"];
						}
				}
			}
			else {
				if (copaBrasil == 0) {
					if (brasileiro == 0) {
						mundialLabel.hidden = NO ;
						mundialTrofeuImage.hidden = NO ;
						mundialLabel.text = [NSString stringWithFormat:@"x%i",mundial];
						mundialTrofeuImage.image = [UIImage imageNamed:@"mundial.png"];
						brasileiroLabel.hidden = NO ;
						brasileiroTrofeuImage.hidden = NO ;
						brasileiroLabel.text = [NSString stringWithFormat:@"x%i",paulista];
						brasileiroTrofeuImage.image = [UIImage imageNamed:@"paulista.png"];
					}
					else {
						mundialLabel.hidden = NO ;
						mundialTrofeuImage.hidden = NO ;
						mundialLabel.text = [NSString stringWithFormat:@"x%i",mundial];
						mundialTrofeuImage.image = [UIImage imageNamed:@"mundial.png"];
						brasileiroLabel.hidden = NO ;
						brasileiroTrofeuImage.hidden = NO ;
						brasileiroLabel.text = [NSString stringWithFormat:@"x%i",brasileiro];
						brasileiroTrofeuImage.image = [UIImage imageNamed:@"brasileiro.png"];
						copaBrasilLabel.hidden = NO ;
						copaBrasilTrofeuImage.hidden = NO ;
						copaBrasilLabel.text = [NSString stringWithFormat:@"x%i",paulista];
						copaBrasilTrofeuImage.image = [UIImage imageNamed:@"paulista.png"];
						
					}
					
				}
				else {
					if (brasileiro == 0) {
						mundialLabel.hidden = NO ;
						mundialTrofeuImage.hidden = NO ;
						mundialLabel.text = [NSString stringWithFormat:@"x%i",mundial];
						mundialTrofeuImage.image = [UIImage imageNamed:@"mundial.png"];
						brasileiroLabel.hidden = NO ;
						brasileiroTrofeuImage.hidden = NO ;
						brasileiroLabel.text = [NSString stringWithFormat:@"x%i",copaBrasil];
						brasileiroTrofeuImage.image = [UIImage imageNamed:@"copadobrasil.png"];
						copaBrasilLabel.hidden = NO ;
						copaBrasilTrofeuImage.hidden = NO ;
						copaBrasilLabel.text = [NSString stringWithFormat:@"x%i",paulista];
						copaBrasilTrofeuImage.image = [UIImage imageNamed:@"paulista.png"];
					}
					else {
						mundialLabel.hidden = NO ;
						mundialTrofeuImage.hidden = NO ;
						mundialLabel.text = [NSString stringWithFormat:@"x%i",mundial];
						mundialTrofeuImage.image = [UIImage imageNamed:@"mundial.png"];
						brasileiroLabel.hidden = NO ;
						brasileiroTrofeuImage.hidden = NO ;
						brasileiroLabel.text = [NSString stringWithFormat:@"x%i",brasileiro];
						brasileiroTrofeuImage.image = [UIImage imageNamed:@"brasileiro.png"];
						copaBrasilLabel.hidden = NO ;
						copaBrasilTrofeuImage.hidden = NO ;
						copaBrasilLabel.text = [NSString stringWithFormat:@"x%i",copaBrasil];
						copaBrasilTrofeuImage.image = [UIImage imageNamed:@"copadobrasil.png"];
						paulistaLabel.hidden = NO ;
						paulistaTrofeuImage.hidden = NO ;
						paulistaLabel.text = [NSString stringWithFormat:@"x%i",paulista];
						paulistaTrofeuImage.image = [UIImage imageNamed:@"paulista.png"];
						
					}
					
				}
			}
		}
}


-(IBAction) segmentoAction:(id)sender {
	if (tipoIdoloSegment.selectedSegmentIndex == 0) {
		megaArray = backUpArray ;
		[idolosTableView reloadData];
		[self reloadTela];
	}
	else {
		if (tipoIdoloSegment.selectedSegmentIndex == 1) {
			megaArray = goleirosArray ;
			[idolosTableView reloadData];
			[self reloadTela];
		}
		else {
			if (tipoIdoloSegment.selectedSegmentIndex == 2) {
				megaArray = defesaArray ;
				[idolosTableView reloadData];
				[self reloadTela];
			}
			else {
				if (tipoIdoloSegment.selectedSegmentIndex == 3) {
					megaArray = meioArray ;
					[idolosTableView reloadData];
					[self reloadTela];
				}
				else {
					if (tipoIdoloSegment.selectedSegmentIndex == 4) {
						megaArray = ataqueArray ;
						[idolosTableView reloadData];
						[self reloadTela];
					}
				}

			}

		}

	}

}
		 
-(void)reloadTela {
	//[idolosTableView selectRowAtIndexPath:megaArray animated:YES scrollPosition:0];
	NSDictionary*mainDict = [megaArray objectAtIndex:0];
	nomePlayer.text = [mainDict objectForKey:@"nomeIdolo"];
	imagePlayer.image = [UIImage imageNamed:[mainDict objectForKey:@"imageGrande"]];
	NSString* alturaDude = [mainDict objectForKey:@"alturaIdolo"];
	NSString* nA = [NSString stringWithFormat:@"n/a"];
	NSComparisonResult resultAltura = [alturaDude compare:nA options:(NSCaseInsensitiveSearch)];
	if (resultAltura == NSOrderedSame) {
		alturaPlayer.text = alturaDude ;
	}
	else {
		alturaPlayer.text = [NSString stringWithFormat:@"%@ m",alturaDude];
		
	}
	bornPlayer.text = [mainDict objectForKey:@"idadeIdolo"] ;
	jogosPlayer.text = [mainDict objectForKey:@"jogosIdolo"];
	golsPlayer.text = [mainDict objectForKey:@"golsIdolo"];
	NSString* pezinhoIdolo = [mainDict objectForKey:@"peIdolo"];
	NSString* destro = [NSString stringWithFormat:@"destro"];
	NSComparisonResult resultPezito = [destro compare:pezinhoIdolo options:(NSCaseInsensitiveSearch|NSDiacriticInsensitiveSearch) range:NSMakeRange(0, [pezinhoIdolo length])];
	if (resultPezito == NSOrderedSame) {
		pePlayer.image = [UIImage imageNamed:@"PD.png"];
		
	}
	else {
		pePlayer.image = [UIImage imageNamed:@"PE.png"];
	}
	NSString* glIdolo = [mainDict objectForKey:@"GLIdolo"];
	NSString* positivoString = [NSString stringWithFormat:@"sim"];
	NSComparisonResult resultGL = [positivoString compare:glIdolo options:(NSCaseInsensitiveSearch)];
	if (resultGL == NSOrderedSame) {
		glPOS.image = [UIImage imageNamed:@"GL_on.png"];
	}
	else {
		glPOS.image = [UIImage imageNamed:@"GL_off.png"];
	}
	NSString* zgIdolo = [mainDict objectForKey:@"ZGIdolo"];
	NSComparisonResult resultZG = [positivoString compare:zgIdolo options:(NSCaseInsensitiveSearch)];
	if (resultZG == NSOrderedSame) {
		zgPOS.image = [UIImage imageNamed:@"ZG_on.png"];
	}
	else {
		zgPOS.image = [UIImage imageNamed:@"ZG_off.png"];
	}
	NSString* ldIdolo = [mainDict objectForKey:@"LDIdolo"];
	NSComparisonResult resultLD = [positivoString compare:ldIdolo options:(NSCaseInsensitiveSearch)];
	if (resultLD == NSOrderedSame) {
		ldPOS.image = [UIImage imageNamed:@"LD_on.png"];
	}
	else {
		ldPOS.image = [UIImage imageNamed:@"LD_off.png"];
	}
	NSString* leIdolo = [mainDict objectForKey:@"LEIdolo"];
	NSComparisonResult resultLE = [positivoString compare:leIdolo options:(NSCaseInsensitiveSearch)];
	if (resultLE == NSOrderedSame) {
		lePOS.image = [UIImage imageNamed:@"LE_on.png"];
	}
	else {
		lePOS.image = [UIImage imageNamed:@"LE_off.png"];
	}
	NSString* vlIdolo =[mainDict objectForKey:@"VLIdolo"];
	NSComparisonResult resultVL = [positivoString compare:vlIdolo options:(NSCaseInsensitiveSearch)];
	if (resultVL == NSOrderedSame) {
		vlPOS.image = [UIImage imageNamed:@"VL_on.png"];
	}
	else {
		vlPOS.image = [UIImage imageNamed:@"VL_off.png"];
	}
	NSString* mcIdolo = [mainDict objectForKey:@"MCIdolo"];
	NSComparisonResult resultMC = [positivoString compare:mcIdolo options:(NSCaseInsensitiveSearch)];
	if (resultMC == NSOrderedSame) {
		mcPOS.image = [UIImage imageNamed:@"MC_on.png"];
	}
	else {
		mcPOS.image = [UIImage imageNamed:@"MC_off.png"];
	}
	NSString* meIdolo = [mainDict objectForKey:@"MEIdolo"];
	NSComparisonResult resultME = [positivoString compare:meIdolo options:(NSCaseInsensitiveSearch)];
	if (resultME == NSOrderedSame) {
		mePOS.image = [UIImage imageNamed:@"ME_on.png"];
	}
	else {
		mePOS.image = [UIImage imageNamed:@"ME_off.png"];
	}
	NSString* mdIdolo = [mainDict objectForKey:@"MDIdolo"];
	NSComparisonResult resultMD = [positivoString compare:mdIdolo options:(NSCaseInsensitiveSearch)];
	if (resultMD == NSOrderedSame) {
		mdPOS.image = [UIImage imageNamed:@"MD_on.png"];
	}
	else {
		mdPOS.image= [UIImage imageNamed:@"MD_off.png"];
	}
	NSString* atIdolo = [mainDict objectForKey:@"ATIdolo"];
	NSComparisonResult resultAT = [positivoString compare:atIdolo options:(NSCaseInsensitiveSearch)];
	if (resultAT == NSOrderedSame) {
		atPOS.image = [UIImage imageNamed:@"AT_on.png"];
	}
	else {
		atPOS.image = [UIImage imageNamed:@"AT_off.png"];
	}
	NSString* PLIdolo = [mainDict objectForKey:@"PLIdolo"];
	NSComparisonResult resultPL = [positivoString compare:PLIdolo options:(NSCaseInsensitiveSearch)];
	if (resultPL == NSOrderedSame) {
		plPOS.image = [UIImage imageNamed:@"CA_on.png"];
	}
	else {
		plPOS.image = [UIImage imageNamed:@"CA_off.png"];
	}
	
	NSString*posicaoIdolo = [mainDict objectForKey:@"posicaoIdolo"];
	NSString* goleiroString = [NSString stringWithFormat:@"Goleiro"];
	NSComparisonResult resultGoleiro = [goleiroString compare:posicaoIdolo options:(NSCaseInsensitiveSearch)];
	if (resultGoleiro == NSOrderedSame) {
		fieldImage.image = [UIImage imageNamed:@"gol.png"];
	}
	else {
		NSString* zagueiroString = [NSString stringWithFormat:@"Zagueiro"];
		NSComparisonResult resultZagueiro = [zagueiroString  compare:posicaoIdolo options:(NSCaseInsensitiveSearch)];
		if (resultZagueiro == NSOrderedSame) {
			fieldImage.image = [UIImage imageNamed:@"zagua.png"];
			
		}
		else {
			NSString* lateralEString = [NSString stringWithFormat:@"Lateral-Esquerdo"];
			NSComparisonResult resultLateralE = [lateralEString compare:posicaoIdolo options:(NSCaseInsensitiveSearch|NSDiacriticInsensitiveSearch)];
			if (resultLateralE == NSOrderedSame) {
				fieldImage.image = [UIImage imageNamed:@"laterale.png"];
				
			}
			else {
				NSString* lateralDString = [NSString stringWithFormat:@"Lateral-Direito"];
				NSComparisonResult resultLateralD = [lateralDString compare:posicaoIdolo options:(NSCaseInsensitiveSearch|NSDiacriticInsensitiveSearch)];
				if (resultLateralD == NSOrderedSame) {
					fieldImage.image = [UIImage imageNamed:@"laterald.png"];
					
				}
				else {
					NSString* meioCampoString = [NSString stringWithFormat:@"meioCampo"];
					NSComparisonResult resultMeioCampo = [meioCampoString compare:posicaoIdolo options:(NSCaseInsensitiveSearch)];
					if (resultMeioCampo == NSOrderedSame) {
						fieldImage.image = [UIImage imageNamed:@"meiocampo.png"];
						
					}
					else {
						NSString* meioCampoEString = [NSString stringWithFormat:@"meioCampoEsquerda"];
						NSComparisonResult resultMeioCampoEsquerdo = [meioCampoEString compare:posicaoIdolo options:(NSCaseInsensitiveSearch)];
						if (resultMeioCampoEsquerdo == NSOrderedSame) {
							fieldImage.image = [UIImage imageNamed:@"meiae.png"];
							
						}
						else {
							NSString* meioCampoDSTring = [NSString stringWithFormat:@"meioCampoDireita"];
							NSComparisonResult resultMeioCampoDireito = [meioCampoDSTring compare:posicaoIdolo options:(NSCaseInsensitiveSearch)];
							if (resultMeioCampoDireito == NSOrderedSame) {
								fieldImage.image = [UIImage imageNamed:@"meiad.png"];
								
							}
							else {
								NSString* volateSTring = [NSString stringWithFormat:@"volante"];
								NSComparisonResult	resultVolante = [volateSTring compare:posicaoIdolo options:(NSCaseInsensitiveSearch)];
								if (resultVolante == NSOrderedSame) {
									fieldImage.image = [UIImage imageNamed:@"meiadefesa.png"];
									
								}
								else {
									NSString* atacanteString = [NSString stringWithFormat:@"atacante"];
									NSComparisonResult resultAtacante = [atacanteString compare:posicaoIdolo options:(NSCaseInsensitiveSearch)];
									if (resultAtacante == NSOrderedSame) {
										fieldImage.image = [UIImage imageNamed:@"ataque.png"];
										
									}
									else {
										NSString* pontaString = [NSString stringWithFormat:@"centroAvante"];
										NSComparisonResult resultCentro = [pontaString compare:posicaoIdolo options:(NSCaseInsensitiveSearch)];
										if (resultCentro == NSOrderedSame) {
											fieldImage.image = [UIImage imageNamed:@"banheira.png"];
											
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
	
	NSNumber* mundialNum = [mainDict objectForKey:@"mundial"];
	int mundial = [mundialNum intValue];
		//	NSLog(@"MUNDIAL %i",mundial);
	NSLog(@"%i mundial",mundial);
	NSNumber* paulistNun = [mainDict objectForKey:@"paulista"];
	int paulista = [paulistNun intValue];
	NSLog(@"%i paulista",paulista);
	NSNumber* brasileiroNun = [mainDict	objectForKey:@"brasileiro"];
	int brasileiro = [brasileiroNun intValue];
	NSLog(@"%i brasileiro",brasileiro);
	NSNumber* copaBrasilNum = [mainDict objectForKey:@"copaBrasil"];
	int copaBrasil = [copaBrasilNum intValue];
	NSLog(@"%i copaBrasil",copaBrasil);
		//	int mundial = 0 ;
	paulistaLabel.hidden = YES ;
	paulistaTrofeuImage.hidden = YES ;
	copaBrasilLabel.hidden = YES ;
	copaBrasilTrofeuImage.hidden = YES ;
	brasileiroLabel.hidden = YES ;
	brasileiroTrofeuImage.hidden = YES ;
	mundialLabel.hidden = YES ;
	mundialTrofeuImage.hidden = YES ;
		//BAGULHO BEM FODA DOS TROFEIS 
	if (mundial == 0) {
		if (brasileiro == 0) {
			if (copaBrasil == 0) {
				if (paulista == 0) {
				}
				else {
					mundialLabel.hidden = NO ;
					mundialTrofeuImage.hidden = NO ;
					mundialLabel.text = [NSString stringWithFormat:@"x%i",paulista];
					mundialTrofeuImage.image = [UIImage imageNamed:@"paulista.png"];
				}
			}
			else {
				if (paulista == 0) {
					mundialLabel.hidden = NO ;
					mundialTrofeuImage.hidden = NO ;
					mundialLabel.text = [NSString stringWithFormat:@"x%i",copaBrasil];
					mundialTrofeuImage.image = [UIImage imageNamed:@"brasileiro.png"];
				}
				else {
					brasileiroLabel.hidden = NO ;
					brasileiroTrofeuImage.hidden = NO ;
					brasileiroLabel.text = [NSString stringWithFormat:@"x%i",paulista];
					brasileiroTrofeuImage.image = [UIImage imageNamed:@"paulista.png"];
					mundialLabel.hidden = NO ;
					mundialTrofeuImage.hidden = NO ;
					mundialLabel.text = [NSString stringWithFormat:@"x%i",copaBrasil];
					mundialTrofeuImage.image = [UIImage imageNamed:@"brasileiro.png"];
				}
			}
		}
		else {
			if (paulista == 0) {
				if (copaBrasil == 0) {
					mundialLabel.hidden = NO ;
					mundialTrofeuImage.hidden = NO ;
					mundialLabel.text = [NSString stringWithFormat:@"x%i",brasileiro];
					mundialTrofeuImage.image = [UIImage imageNamed:@"brasileiro.png"];
				}
				else {
					brasileiroLabel.hidden = NO ;
					brasileiroTrofeuImage.hidden = NO ;
					brasileiroLabel.text = [NSString stringWithFormat:@"x%i",copaBrasil];
					brasileiroTrofeuImage.image = [UIImage imageNamed:@"copadobrasil.png"];
					mundialLabel.hidden = NO ;
					mundialTrofeuImage.hidden = NO ;
					mundialLabel.text = [NSString stringWithFormat:@"x%i",brasileiro];
					mundialTrofeuImage.image = [UIImage imageNamed:@"brasileiro.png"];
				}
				
			}
			else {
				if (copaBrasil == 0) {
					mundialLabel.hidden = NO ;
					mundialTrofeuImage.hidden = NO ;
					mundialLabel.text = [NSString stringWithFormat:@"x%i",brasileiro];
					mundialTrofeuImage.image = [UIImage imageNamed:@"brasileiro.png"];
					brasileiroLabel.hidden = NO ;
					brasileiroTrofeuImage.hidden = NO ;
					brasileiroLabel.text = [NSString stringWithFormat:@"x%i",paulista];
					brasileiroTrofeuImage.image = [UIImage imageNamed:@"paulista.png"];
				}
				else {
					copaBrasilLabel.hidden = NO ;
					copaBrasilTrofeuImage.hidden = NO ;
					copaBrasilLabel.text = [NSString stringWithFormat:@"x%i",paulista];
					copaBrasilTrofeuImage.image = [UIImage imageNamed:@"paulista.png"];
					brasileiroLabel.hidden = NO ;
					brasileiroTrofeuImage.hidden = NO ;
					brasileiroLabel.text = [NSString stringWithFormat:@"x%i",copaBrasil];
					brasileiroTrofeuImage.image = [UIImage imageNamed:@"copadobrasil.png"];
					mundialLabel.hidden = NO ;
					mundialTrofeuImage.hidden = NO ;
					mundialLabel.text = [NSString stringWithFormat:@"x%i",brasileiro];
					mundialTrofeuImage.image = [UIImage imageNamed:@"brasileiro.png"];
				}
			}
		}
	}
	else {
		if (paulista == 0) {
			if (copaBrasil == 0) {
				if (brasileiro == 0) {
					mundialLabel.hidden = NO ;
					mundialTrofeuImage.hidden = NO ;
					mundialLabel.text = [NSString stringWithFormat:@"x%i",mundial];
					mundialTrofeuImage.image = [UIImage imageNamed:@"mundial.png"];
				}
				else {
					mundialLabel.hidden = NO ;
					mundialTrofeuImage.hidden = NO ;
					mundialLabel.text = [NSString stringWithFormat:@"x%i",mundial];
					mundialTrofeuImage.image = [UIImage imageNamed:@"mundial.png"];
					brasileiroLabel.hidden = NO ;
					brasileiroTrofeuImage.hidden = NO ;
					brasileiroLabel.text = [NSString stringWithFormat:@"x%i",brasileiro];
					brasileiroTrofeuImage.image = [UIImage imageNamed:@"brasileiro.png"];
				}
				
			}
			else {
				if (brasileiro == 0) {
					mundialLabel.hidden = NO ;
					mundialTrofeuImage.hidden = NO ;
					mundialLabel.text = [NSString stringWithFormat:@"x%i",mundial];
					mundialTrofeuImage.image = [UIImage imageNamed:@"mundial.png"];
					brasileiroLabel.hidden = NO ;
					brasileiroTrofeuImage.hidden = NO ;
					brasileiroLabel.text = [NSString stringWithFormat:@"x%i",copaBrasil];
					brasileiroTrofeuImage.image = [UIImage imageNamed:@"copadobrasil.png"];
				}
				else {
					mundialLabel.hidden = NO ;
					mundialTrofeuImage.hidden = NO ;
					mundialLabel.text = [NSString stringWithFormat:@"x%i",mundial];
					mundialTrofeuImage.image = [UIImage imageNamed:@"mundial.png"];
					brasileiroLabel.hidden = NO ;
					brasileiroTrofeuImage.hidden = NO ;
					brasileiroLabel.text = [NSString stringWithFormat:@"x%i",brasileiro];
					brasileiroTrofeuImage.image = [UIImage imageNamed:@"brasileiro.png"];
					copaBrasilLabel.hidden = NO ;
					copaBrasilTrofeuImage.hidden = NO ;
					copaBrasilLabel.text = [NSString stringWithFormat:@"x%i",copaBrasil];
					copaBrasilTrofeuImage.image = [UIImage imageNamed:@"copadobrasil.png"];
				}
			}
		}
		else {
			if (copaBrasil == 0) {
				if (brasileiro == 0) {
					mundialLabel.hidden = NO ;
					mundialTrofeuImage.hidden = NO ;
					mundialLabel.text = [NSString stringWithFormat:@"x%i",mundial];
					mundialTrofeuImage.image = [UIImage imageNamed:@"mundial.png"];
					brasileiroLabel.hidden = NO ;
					brasileiroTrofeuImage.hidden = NO ;
					brasileiroLabel.text = [NSString stringWithFormat:@"x%i",paulista];
					brasileiroTrofeuImage.image = [UIImage imageNamed:@"paulista.png"];
				}
				else {
					mundialLabel.hidden = NO ;
					mundialTrofeuImage.hidden = NO ;
					mundialLabel.text = [NSString stringWithFormat:@"x%i",mundial];
					mundialTrofeuImage.image = [UIImage imageNamed:@"mundial.png"];
					brasileiroLabel.hidden = NO ;
					brasileiroTrofeuImage.hidden = NO ;
					brasileiroLabel.text = [NSString stringWithFormat:@"x%i",brasileiro];
					brasileiroTrofeuImage.image = [UIImage imageNamed:@"brasileiro.png"];
					copaBrasilLabel.hidden = NO ;
					copaBrasilTrofeuImage.hidden = NO ;
					copaBrasilLabel.text = [NSString stringWithFormat:@"x%i",paulista];
					copaBrasilTrofeuImage.image = [UIImage imageNamed:@"paulista.png"];
					
				}
				
			}
			else {
				if (brasileiro == 0) {
					mundialLabel.hidden = NO ;
					mundialTrofeuImage.hidden = NO ;
					mundialLabel.text = [NSString stringWithFormat:@"x%i",mundial];
					mundialTrofeuImage.image = [UIImage imageNamed:@"mundial.png"];
					brasileiroLabel.hidden = NO ;
					brasileiroTrofeuImage.hidden = NO ;
					brasileiroLabel.text = [NSString stringWithFormat:@"x%i",copaBrasil];
					brasileiroTrofeuImage.image = [UIImage imageNamed:@"copadobrasil.png"];
					copaBrasilLabel.hidden = NO ;
					copaBrasilTrofeuImage.hidden = NO ;
					copaBrasilLabel.text = [NSString stringWithFormat:@"x%i",paulista];
					copaBrasilTrofeuImage.image = [UIImage imageNamed:@"paulista.png"];
				}
				else {
					mundialLabel.hidden = NO ;
					mundialTrofeuImage.hidden = NO ;
					mundialLabel.text = [NSString stringWithFormat:@"x%i",mundial];
					mundialTrofeuImage.image = [UIImage imageNamed:@"mundial.png"];
					brasileiroLabel.hidden = NO ;
					brasileiroTrofeuImage.hidden = NO ;
					brasileiroLabel.text = [NSString stringWithFormat:@"x%i",brasileiro];
					brasileiroTrofeuImage.image = [UIImage imageNamed:@"brasileiro.png"];
					copaBrasilLabel.hidden = NO ;
					copaBrasilTrofeuImage.hidden = NO ;
					copaBrasilLabel.text = [NSString stringWithFormat:@"x%i",copaBrasil];
					copaBrasilTrofeuImage.image = [UIImage imageNamed:@"copadobrasil.png"];
					paulistaLabel.hidden = NO ;
					paulistaTrofeuImage.hidden = NO ;
					paulistaLabel.text = [NSString stringWithFormat:@"x%i",paulista];
					paulistaTrofeuImage.image = [UIImage imageNamed:@"paulista.png"];
				}
				
			}
		}
	}
}

- (void)didReceiveMemoryWarning {
	// Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
	
	// Release any cached data, images, etc that aren't in use.
}

- (void)viewDidUnload {
	NSLog(@"viewdidunload");

	// Release any retained subviews of the main view.
	// e.g. self.myOutlet = nil;
}


- (void)dealloc {
	NSLog(@"dealloc");
//	[idolosTableView release];
	[nomePlayer release]; 
	[alturaPlayer release];
	[bornPlayer release];
	[jogosPlayer release];
	[golsPlayer release]; 
	[pePlayer release];
	[glPOS release];
	[zgPOS release];
	[ldPOS release];
	[lePOS release];
	[atPOS release];
	[vlPOS release];
	[mcPOS release];
	[mePOS release];
	[mdPOS release];
	[plPOS release];
	[fieldImage release];
	[imagePlayer release];
	[tipoIdoloSegment release];
	[mundialTrofeuImage release];
	[brasileiroTrofeuImage release]; 
	[copaBrasilTrofeuImage release]; 
	[paulistaTrofeuImage release];
	[mundialLabel release];
	[brasileiroLabel release];
	[copaBrasilLabel release];
	[paulistaLabel release];
	[tmpCell release];
//	[megaArray release];
	[superArray release];
	[goleirosArray release];
	[defesaArray release];
	[meioArray release];
	[ataqueArray release];
	[backUpArray release];
	[super dealloc];
}


@end
