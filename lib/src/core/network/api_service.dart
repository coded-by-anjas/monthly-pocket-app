import 'package:dio/dio.dart';
import 'package:monthly_pocket/src/shared/models/category.dart';
import 'package:monthly_pocket/src/shared/models/expense_with_names.dart';
import 'package:monthly_pocket/src/shared/models/income_response.dart';
import 'package:monthly_pocket/src/shared/models/pocket_with_balance.dart';
import 'package:retrofit/retrofit.dart';

part 'api_service.g.dart';

@RestApi()
abstract class ApiService {
  factory ApiService(Dio dio, {String baseUrl}) = _ApiService;

  // ---------------------------------------------------------------------------
  // Income
  // ---------------------------------------------------------------------------

  @GET('/api/incomes')
  Future<IncomeResponse?> getIncome();

  @POST('/api/incomes')
  Future<IncomeResponse> setIncome(@Body() Map<String, dynamic> body);

  // ---------------------------------------------------------------------------
  // Pockets
  // ---------------------------------------------------------------------------

  @GET('/api/pockets')
  Future<List<PocketWithBalance>> getPockets();

  @POST('/api/pockets')
  Future<PocketWithBalance> createPocket(@Body() Map<String, dynamic> body);

  @PATCH('/api/pockets/{id}')
  Future<PocketWithBalance> updatePocket(
    @Path('id') String id,
    @Body() Map<String, dynamic> body,
  );

  @DELETE('/api/pockets/{id}')
  Future<void> deletePocket(@Path('id') String id);

  // ---------------------------------------------------------------------------
  // Categories
  // ---------------------------------------------------------------------------

  @GET('/api/categories')
  Future<List<Category>> getCategories();

  // ---------------------------------------------------------------------------
  // Expenses
  // ---------------------------------------------------------------------------

  @GET('/api/expenses')
  Future<List<ExpenseWithNames>> getExpenses({
    @Query('period') String? period,
    @Query('pocket_id') String? pocketId,
    @Query('category_id') String? categoryId,
    @Query('start_date') String? startDate,
    @Query('end_date') String? endDate,
  });

  @POST('/api/expenses')
  Future<Expense> createExpense(@Body() Map<String, dynamic> body);

  @DELETE('/api/expenses/{id}')
  Future<void> deleteExpense(@Path('id') String id);
}
